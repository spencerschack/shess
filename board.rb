class Board

	attr_reader :board, :from, :to

	def initialize
		@board = [
			[  Rook, Knight, Bishop,  Queen,   King, Bishop, Knight,   Rook],
			[  Pawn,   Pawn,   Pawn,   Pawn,   Pawn,   Pawn,   Pawn,   Pawn],
			[   nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil],
			[   nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil],
			[   nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil],
			[   nil,    nil,    nil,    nil,    nil,    nil,    nil,    nil],
			[  Pawn,   Pawn,   Pawn,   Pawn,   Pawn,   Pawn,   Pawn,   Pawn],
			[  Rook, Knight, Bishop,  Queen,   King, Bishop, Knight,   Rook]
		]
		board[0..1].each{|row| row.map!{|klass| klass.new(self, :white) } }
		board[6..7].each{|row| row.map!{|klass| klass.new(self, :black) } }
		@from = Coordinate.new(0, 0)
		@to = Coordinate.new
	end

	def draw
		if @printed
			print "\e[9A"
		else
			@printed = true
		end
		puts ''
		board.each_with_index do |row, y|
			print '  '
			row.each_with_index do |piece, x|
				print "\e[48;5;#{color_for(x, y)}m"
				print piece ? piece.to_s : ' '
				print ' '
			end
			puts "\e[0m"
		end
	end

	def enter
		if to.valid?
			move from, to
		else
			to.move_to(from)
		end
	end

	def up
		cursor.y -= 1
	end

	def down
		cursor.y += 1
	end

	def right
		cursor.x += 1
	end

	def left
		cursor.x -= 1
	end

	def [] coord
		board[coord.y][coord.x]
	end

	def []= coord, value
		board[coord.y][coord.x] = value
	end

	private

	def cursor
		to.valid? ? to : from
	end

	def move from, to
		if self[from] && self[from].move(from, to)
			from.move_to(to)
			to.reset
		end
	end

	def color_for x, y
		case
		when to.at?(x, y)
			202
		when from.at?(x, y)
			27
		when (x + y).odd?
			238
		else
			244
		end
	end

end