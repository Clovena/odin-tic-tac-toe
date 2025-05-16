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
    Check.winner?(Check.win_conditions(@gameboard.board)) ||
      @gameboard.squares_left.empty?
  end

  def declare_winner(name)
    return puts 'It\'s a tie...' if @gameboard.squares_left.empty?

    puts "#{name} wins!"
  end
end

game = TicTacToe.new
puts game.gameboard.format(game.gameboard.board)

until game.over?
  game.gameboard.turn(game.players.char1)
  last_turn = game.players.name1 # rubocop:disable Lint/UselessAssignment
  break if game.over?

  game.gameboard.turn(game.players.char2)
  last_turn = game.players.name2
end
game.declare_winner(last_turn)
