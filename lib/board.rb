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

  def squares_left(arr)
    arr.flatten.select { |elem| elem.to_i.positive? }
  end

  def record_turn(square, player)
    row = (square.to_i / 3.0).ceil - 1
    col = (square.to_i % 3) - 1
    @board[row][col] = player
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
    square = gets[0]
    until squares_left(@board).include?(square)
      print 'Invalid input. Pick a square: '
      square = gets[0]
    end

    record_turn(square, player)
    puts format(@board)
    @board
  end
end
