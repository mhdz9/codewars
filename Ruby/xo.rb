=begin
Check to see if a string has the same amount of 'x's and 'o's. The method must return a boolean and be case insensitive. The string can contain any char.

Examples input/output:
	XO("ooxx") => true
	XO("xooxx") => false
	XO("ooxXm") => true
	XO("zpzpzpp") => true // when no 'x' and 'o' is present should return true
	XO("zzoo") => false
=end

def XO(str)
    counts=Hash.new 0
    strArr=str.downcase.split("")
    
    strArr.each do |x|
        if x == "x" or x == "o" then
            counts[x]+=1
        end
    end
        
    return counts.values[0] == counts.values[1] ? true : false
end