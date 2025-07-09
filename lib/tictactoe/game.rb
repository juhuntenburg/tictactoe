# frozen_string_literal: true

# Class to initialize a board and players and play until won
class Game
  attr_accessor :board, :players

  def initialize
    @board = Board.new
    @players = [Player.new("X", @board), Player.new("O", @board)].shuffle
  end

  def play
    winner = rounds
    puts board
    puts "Player #{winner.token} won!"
  end

  def rounds
    players.cycle do |player|
      puts board
      field = player.move
      return player if board.won?(field)
    end
  end
end
