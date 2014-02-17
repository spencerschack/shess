#! /usr/bin/env ruby

require 'io/console'
require 'uci'
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

Board.new.play