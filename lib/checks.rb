# frozen_string_literal: true

# Methods to validate game during play
module Check
  def self.win_conditions(array)
    # Obtain diagonals
    diag_fwd = [] # from sq 1 to 9
    diag_bwd = [] # from sq 3 to 7
    array.each_index do |i|
      diag_fwd << array[i][i]
      diag_bwd << array[-i][i]
    end
    # Return nested array of possible wins
    array + # Rowwise
      array.transpose + # Columnwise
      [diag_fwd] + [diag_bwd] # Diagonals
  end

  def self.winner?(array)
    array.each do |elem|
      return true if elem.uniq.size <= 1
    end
    false
  end
end
