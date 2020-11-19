=begin
An isogram is a word that has no repeating letters, consecutive or non-consecutive. Implement a function that determines whether a string that contains only letters is an isogram. Assume the empty string is an isogram. Ignore letter case.

    isIsogram("Dermatoglyphics") == true
    isIsogram("aba") == false
    isIsogram("moOse") == false // -- ignore letter case
=end

def is_isogram(string)
    letters=string.downcase.split('')
    counts=Hash.new 0
    kvalues=Array.new
    
    letters.each do |x|
        counts[x]+=1
    end
    
    counts.each do |k, v|
        if v > 1 then
            kvalues.push(k)
        end
    end
    
    if kvalues.empty? or letters.empty? then
       return true
    else
       return false
    end
    
end