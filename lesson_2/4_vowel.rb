vowel_letters = {}
letter_number = 1

for letter in "a".."z"
  vowel_letters[letter] = letter_number
  letter_number += 1
end

puts vowel_letters.select! { |letter, letter_number| ["a", "e", "i", "o", "u", "y"].include?(letter) }
