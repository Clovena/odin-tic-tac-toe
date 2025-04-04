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

  def format(arr)
    squares = arr.flatten

    "\n #{squares[0]} | #{squares[1]} | #{squares[2]}
---+---+---\n #{squares[3]} | #{squares[4]} | #{squares[5]}
---+---+---\n #{squares[6]} | #{squares[7]} | #{squares[8]} \n\n"
  end

  # method to write single value into board
  def turn(player)
    print 'Pick a square: '
    square = gets[0].to_i

    until [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(square)
      print 'Invalid input. Pick a square: '
      square = gets[0].to_i
    end

    row = (square / 3.0).ceil - 1
    col = (square % 3) - 1
    @board[row][col] = player
    puts self.format(@board)
    @board
  end
end
