=begin
Longest Palindrome
Find the length of the longest substring in the given string s that is the same in reverse.

As an example, if the input was “I like racecars that go fast”, the substring (racecar) length would be 7.

If the length of the input string is 0, the return value must be 0.

Example:
	"a" -> 1 
	"aab" -> 2  
	"abcde" -> 1
	"zzbaabcd" -> 4
	"" -> 0
=end

def longest_palindrome(s)
  palindromes = Array.new
  for i in 1..s.length
    s.chars.each_cons(i).each {|x| palindromes.push(x) unless x != x.reverse}
  end
  palindrome = palindromes.map(&:join).max_by(&:length).to_s.length
end