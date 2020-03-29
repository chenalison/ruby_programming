def caesar_cipher(string, shift)
    uppercase = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    lowercase = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    encode = ""
    string.length.times { |index|
        letter = string[index]
        if uppercase.include?(letter)
            new_letter = uppercase.find_index(letter)
            new_letter += shift
            new_letter = new_letter % 26
            new_letter = uppercase[new_letter]
            encode += new_letter
        elsif lowercase.include?(letter)
            new_letter = lowercase.find_index(letter)
            new_letter += shift
            new_letter = new_letter % 26
            new_letter = lowercase[new_letter]
            encode += new_letter
        else
            encode += letter
        end
    }
    return encode
end

puts caesar_cipher("What a string!", 5)
puts caesar_cipher("Caesar cipher.", 0)
puts caesar_cipher("Caesar cipher.", 1)
puts caesar_cipher("Caesar cipher.", -1)