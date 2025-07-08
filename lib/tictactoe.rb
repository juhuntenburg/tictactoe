# frozen_string_literal: true

require_relative "tictactoe/board"
require_relative "tictactoe/player"

# Class for a player
# Method to ask for input (check if input valid (field exists, is free)
# otherwise ask again)
# Send a choice to the board

# Class for a game?
# Initializes board
# Creates players
# Loops and checks for (announces) win

board = Board.new
player = Player.new("X", board)
player.move
puts board
player.move
puts board
