def substrings(string, dictionary)
    string = string.downcase
    count = {}
    dictionary.each { |word|
        if string.include?(word)
            count[word] = string.scan(/(?=#{word})/).count
        end
    }
    return count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)