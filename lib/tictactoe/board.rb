# frozen_string_literal: true

# Class to initialize and manipulate the Game board
class Board
  # These are in terms of true array indices the played fields are +1
  WINNING_IDX = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                 [0, 3, 6], [1, 4, 7], [2, 5, 8],
                 [0, 4, 8], [2, 4, 6]].freeze
  attr_accessor :values

  def initialize
    @values = (1..9).to_a
  end

  def free_field?(field)
    field == values[field - 1]
  end

  def valid_field?(field)
    (1..9).include?(field)
  end

  def update_board(field, token)
    err_msg = "Field #{field} cannot be played"
    raise IOError, err_msg unless valid_field?(field) && free_field?(field)

    values[field - 1] = token
  end

  def to_s
    print_arr = ["\n"]
    (0..2).each do |i|
      row = values[i * 3, 3]
      print_arr << " #{row.join(' | ')}"
      print_arr << "---|---|---" unless i == 2
    end
    print_arr.join("\n")
  end

  private

  def won?(last_field)
    idx = last_field - 1
    won = WINNING_IDX.find do |triple|
      triple.include?(idx) && values.values_at(*triple).uniq.size == 1
    end
    !!won
  end
end
