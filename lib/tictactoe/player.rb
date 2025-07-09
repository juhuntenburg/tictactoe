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
    print "Player #{token}, enter the field you want to play: "
    field = ensure_good_move(gets.chomp.to_i)
    board.update_board(field, token)
    field
  end

  def ensure_good_move(field)
    until board.valid_field?(field) && board.free_field?(field)
      if !board.valid_field?(field)
        print "Field #{field} out of range 1..9, enter a different field: "
      elsif !board.free_field?(field)
        print "Field #{field} already played, enter a different field: "
      end
      field = gets.chomp.to_i
    end
    field
  end
end
