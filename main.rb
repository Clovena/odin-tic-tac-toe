# frozen_string_literal: true

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

  def over?
    Check.winner?(Check.win_conditions(@gameboard.board))
  end

  def declare_winner(name)
    puts "#{name} wins!"
  end
end

game = TicTacToe.new

until game.over?
  game.gameboard.turn(game.players.char1)
  last_turn = game.players.name1
  break if game.over?

  game.gameboard.turn(game.players.char2)
  last_turn = game.players.name2
end
game.declare_winner(last_turn)
