# frozen_string_literal: true

require './lib/checks'

describe Check do # rubocop:disable Metrics/BlockLength
  describe '#win_conditions' do
    it 'produces the correct number of possible wins' do
      board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
      conditions = Check.win_conditions board
      result = conditions.size
      expect(result).to eql 8
    end

    it 'produces no duplicate possible wins' do
      board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
      conditions = Check.win_conditions board
      result = conditions.size == conditions.uniq.size
      expect(result).to be true
    end

    it 'produces all conditions accurately' do
      board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
      conditions = Check.win_conditions board
      goal = [%w[1 2 3], %w[4 5 6], %w[7 8 9],
              %w[1 4 7], %w[2 5 8], %w[3 6 9],
              %w[1 5 9], %w[7 5 3]]
      expect(conditions).to eql(goal)
    end
  end

  describe '#winner?' do
    it 'declares a winner for a simple matrix of the same element' do
      board = [[1], [1], [1]]
      result = Check.winner? board
      expect(result).to be true
    end

    it 'declares a winner for one array of same elements' do
      board = [%w[Z Z Z], [1, 2, 3], [4, 5, 6]]
      result = Check.winner? board
      expect(result).to be true
    end

    it 'declares a winner for multiple arrays of same elements' do
      board = [%w[Z Z Z], [1, 2, 3], %w[O O O], %w[X X X]]
      result = Check.winner? board
      expect(result).to be true
    end

    it 'declares no winner for same element appearing in multiple arrays' do
      board = [['Z', 1, 2], ['Z', 3, 4], ['Z', 5, 6]]
      result = Check.winner? board
      expect(result).to be false
    end
  end

  describe '#win_conditions and #winner? in tandem' do
    it 'declares a winner on a board with a top row winner' do
      board = [%w[Z Z Z], %w[4 5 6], %w[7 8 9]]
      conditions = Check.win_conditions board
      result = Check.winner? conditions
      expect(result).to be true
    end

    it 'declares a winner on a board with a middle row winner' do
      board = [%w[1 2 3], %w[Z Z Z], %w[7 8 9]]
      conditions = Check.win_conditions board
      result = Check.winner? conditions
      expect(result).to be true
    end

    it 'declares a winner on a board with a bottom row winner' do
      board = [%w[1 2 3], %w[4 5 6], %w[Z Z Z]]
      conditions = Check.win_conditions board
      result = Check.winner? conditions
      expect(result).to be true
    end

    it 'declares a winner on a board with a left column winner' do
      board = [%w[Z 2 3], %w[Z 5 6], %w[Z 8 9]]
      conditions = Check.win_conditions board
      result = Check.winner? conditions
      expect(result).to be true
    end

    it 'declares a winner on a board with a middle column winner' do
      board = [%w[1 Z 3], %w[4 Z 6], %w[7 Z 9]]
      conditions = Check.win_conditions board
      result = Check.winner? conditions
      expect(result).to be true
    end

    it 'declares a winner on a board with a right column winner' do
      board = [%w[1 2 Z], %w[4 5 Z], %w[7 8 Z]]
      conditions = Check.win_conditions board
      result = Check.winner? conditions
      expect(result).to be true
    end

    it 'declares a winner on a board with a left diagonal winner' do
      board = [%w[Z 2 3], %w[4 Z 6], %w[7 8 Z]]
      conditions = Check.win_conditions board
      result = Check.winner? conditions
      expect(result).to be true
    end

    it 'declares a winner on a board with a left diagonal winner' do
      board = [%w[1 2 Z], %w[4 Z 6], %w[Z 8 9]]
      conditions = Check.win_conditions board
      result = Check.winner? conditions
      expect(result).to be true
    end
  end
end
