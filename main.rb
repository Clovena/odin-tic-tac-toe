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
require_relative 'lib/checks'

arr = [
  %w[X 2 3],
  %w[4 X O],
  %w[7 O X]
]

puts arr.checks
