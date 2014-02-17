class Coordinate

	attr_reader :x, :y

	def initialize *args
		@x, @y = args
	end

	def move_to coord
		@x, @y = coord.x, coord.y
	end

	def x= x
		@x = x
		@x %= 8
	end

	def y= y
		@y = y
		@y %= 8
	end

	def valid?
		x && y
	end

	def at? x, y
		@x == x && @y == y
	end

	def reset
		@x = @y = nil
	end

	def to_s
		"<#{x || '-'}, #{y || '-'}>"
	end

end