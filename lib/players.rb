# frozen_string_literal: true

# Store player information
class Players
  attr_accessor :name1, :char1, :color1, :name2, :char2, :colo2

  def initialize
    print 'What is Player 1\'s name? '
    @name1 = gets.chomp
    print 'What letter will Player 1 use? '
    @char1 = gets[0]
    @color1 = 'red'

    print 'What is Player 2\'s name? '
    @name2 = gets.chomp
    print 'What letter will Player 2 use? '
    @char2 = gets[0]
    @color2 = 'blue'
  end
end
