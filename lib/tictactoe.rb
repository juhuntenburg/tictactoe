# frozen_string_literal: true

require_relative "tictactoe/board"
require_relative "tictactoe/player"

# Class for a game?
# Initializes board
# Creates players
# Loops and checks for (announces) win

board = Board.new
player = Player.new("X", board)
player.move
puts board
player.move
