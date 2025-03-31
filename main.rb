# frozen_string_literal: true

### Pseudocode
#
#
# Initialize game. Consider asking for size? Or just declare as @@CONSTANT
# Store characters in a 3x3 matrix.
# Ask for input from each player - use toggle to determine which player is up.
# Chomp until single character remains, then overwrite player icon in that space.
#
# Need check that input is only 1 thru 9.

require_relative 'lib/board'
require_relative 'lib/players'
require_relative 'lib/checks'

# Start new game. Compile methods from lib.
class TicTacToe
  attr_accessor :gameboard, :players

  def initialize
    puts 'Welcome to CLI Tic-Tac-Toe!'
    @gameboard = Board.new
    @players = Players.new
  end

  def take_turn
    print 'Pick a square: '
    gets[0].to_i
  end

  def over?
    Check.winner?(Check.win_conditions(@gameboard.board))
  end
end

game = TicTacToe.new

until game.over?
  game.gameboard.turn(game.players.char1, game.take_turn)
  break if game.over?

  game.gameboard.turn(game.players.char2, game.take_turn)
end
