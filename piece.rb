class Piece

	class << self
		attr_accessor :ascii
	end

	attr_accessor :side, :board

	def initialize board, side
		@board, @side = board, side
	end

	def move from, to
		if board[to].nil?
			board[to] = self
			board[from] = nil
			true
		else
			false
		end
	end

	def to_s
		"\e[38;5;#{white? ? 231 : 16}m#{self.class.ascii}"
	end

	def white?
		side == :white
	end

	def black?
		side == :black
	end

end