class Board

	ASCII = {
		king:   "\u265A",
		queen:  "\u265B",
		rook:   "\u265C",
		bishop: "\u265D",
		knight: "\u265E",
		pawn:   "\u265F"
	}

	attr_reader :uci

	def initialize
		@uci = Uci.new(engine_path: '/usr/local/bin/stockfish')
		sleep(1) while !@uci.ready?
	end

	def play
		loop do
			draw
			uci.go!
		end
	end

	def draw
		if @printed
			print "\e[9A"
		else
			@printed = true
		end
		puts ''
		(0..7).each do |y|
			print '  '
			(0..7).each do |x|
				print color_at(x, y)
				print piece_at(x, y)
				print ' '
			end
			puts "\e[0m"
		end
	end

	def piece_at x, y
		x = ('a'..'h').to_a[x]
		y = 8 - y
		pos = "#{x}#{y}"
		if uci.piece_at?(pos)
			piece, color = uci.get_piece(pos)
			"\e[38;5;#{color == :white ? 231 : 16}m#{ASCII[piece]}"
		else
			' '
		end
	end

	def color_at x, y
		"\e[48;5;#{(x + y).odd? ? 238 : 244}m"
	end

end