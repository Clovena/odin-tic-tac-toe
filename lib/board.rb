# frozen_string_literal: true

# Methods to access board state
class Board
  attr_reader :board

  def initialize
    @board = [
      %w[1 2 3],
      %w[4 5 6],
      %w[7 8 9]
    ]
  end

  # method to alter single value
  def turn(char, square)
    row = (square / 3.0).ceil - 1
    col = (square % 3) - 1
    @board[row][col] = char
    @board
  end
end
