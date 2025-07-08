# frozen_string_literal: true

# Class that receives input and sends moves to the board
class Player
  TOKENS = %w[X O].freeze
  attr_reader :token, :board

  def initialize(token, board)
    err_msg = "Unsupported token \"#{token}\", choose from #{TOKENS}"
    raise IOError, err_msg unless TOKENS.include?(token)

    @token = token
    @board = board
  end

  def move
    puts "Player #{token}, enter the field you want to play: "
    field = gets.chomp.to_i

    loop do
      if !board.free_field?(field)
        puts "Field #{field} already played, enter a different field: "
        field = gets.chomp.to_i
      elsif !board.valid_field?(field)
        puts "Field #{field} out of range 1..9, enter a different field: "
        field = gets.chomp.to_i
      else
        break
      end
    end

    board.update_board(field, token)
  end
end
