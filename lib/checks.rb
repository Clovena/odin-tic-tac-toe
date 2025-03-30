# frozen_string_literal: true

def all_equal?(nested_arr)
  nested_arr.each do |arr|
    return true if arr.uniq.size <= 1
  end
end

class Board
  def initialize
    @board_array = [
      %w[1 2 3],
      %w[4 5 6],
      %w[7 8 9]
    ]
  end

  # method to alter single value
  def turn(char, square)
    row = (square / 3.0).round - 1
    col = (square % 3) - 1
    @board_array[row][col] = char
    @board_array
  end

  protected

  attr_accessor :board_array
end

def checks(arr)
  # Obtain diagonals
  diag_fwd = [] # from sq 1 to 9
  diag_bwd = [] # from sq 3 to 7
  arr.each_index do |i|
    diag_fwd << arr[i][i]
    diag_bwd << arr[-i][i]
  end

  arr + # Rowwise checks
    arr.transpose + # Column checks
    [diag_fwd] + # Diagonal checks
    [diag_bwd]
  # true if all_equal?(check_arr)
end
