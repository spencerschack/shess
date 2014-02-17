#! /usr/bin/env ruby

require 'io/console'
require 'pry'
require_relative 'coordinate.rb'
require_relative 'board.rb'
require_relative 'piece.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/bishop.rb'
require_relative 'pieces/knight.rb'
require_relative 'pieces/rook.rb'
require_relative 'pieces/pawn.rb'

board = Board.new
loop do
	board.draw
	STDIN.noecho do |io|
		io.raw do |io|
			input = io.getch
			input << io.read_nonblock(2) rescue nil
			case input
			when "\e[A"
				board.up
			when "\e[B"
				board.down
			when "\e[C"
				board.right
			when "\e[D"
				board.left
			when "\r"
				board.enter
			else
				exit
			end
		end
	end
end