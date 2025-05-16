# frozen_string_literal: true

require './lib/board'

describe Board do
  describe '#squares_left' do
    it 'returns all squares left for the base case' do
      board = Board.new
      result = board.squares_left
      expect(result).to eql(%w[1 2 3 4 5 6 7 8 9])
    end

    it 'returns unused squares for midgame case' do
      board = Board.new([%w[Z 2 3], %w[O O Z], %w[7 8 Z]])
      result = board.squares_left
      expect(result).to eql(%w[2 3 7 8])
    end

    it 'returns no squares when board is full' do
      board = Board.new([%w[Z A C], %w[J A Y], %w[R I C]])
      result = board.squares_left
      expect(result).to eql(%w[])
    end
  end

  describe '#record_turn' do
    it 'correctly records a valid turn' do
      board = Board.new
      board.record_turn(1, 'Z')
      result = board.board
      goal = [%w[Z 2 3], %w[4 5 6], %w[7 8 9]]
      expect(result).to eql(goal)
    end

    it 'returns the symbol of the player' do
      board = Board.new
      player_symbol = 'Z'
      out = board.record_turn(5, player_symbol)
      expect(out).to eql(player_symbol)
    end
  end
end
