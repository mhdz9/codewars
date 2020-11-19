=begin
Greed is a dice game played with five six-sided dice. Your mission, should you choose to accept it, is to score a throw according to these rules. You will always be given an array with five six-sided dice values.

  Three 1's => 1000 points
  Three 6's =>  600 points
  Three 5's =>  500 points
  Three 4's =>  400 points
  Three 3's =>  300 points
  Three 2's =>  200 points
  One   1   =>  100 points 
  One   5   =>   50 point

A single die can only be counted once in each roll. For example, a given "5" can only count as part of a triplet (contributing to the 500 points) or as a single 50 points, but not both in the same roll.

Example scoring
 Throw       Score
 ---------   ------------------
 5 1 3 4 1   250:  50 (for the 5) + 2 * 100 (for the 1s)
 1 1 1 3 1   1100: 1000 (for three 1s) + 100 (for the other 1)
 2 4 4 5 4   450:  400 (for three 4s) + 50 (for the 5)

In some languages, it is possible to mutate the input to the function. This is something that you should never do. If you mutate the input, you will not be able to pass all the tests.
=end

def score(dice)
  puts dice
  hash = Hash.new(0)
  dice.each {|n| hash[n] += 1}
  result = 0
  
  hash.each do |k, v|
    if k == 1 and v >= 3
      result += 1000 + ((v % 3) * 100)
    elsif k == 1 and v < 3
      result += v * 100
    elsif k == 5 and v < 3
      result += v * 50
    elsif (k != 1 or k!= 5) and v >= 3
      result += k * 100
    else
      result += 0
    end
  end
  return result
end