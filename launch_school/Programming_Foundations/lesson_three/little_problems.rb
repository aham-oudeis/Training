# numbers = [1, 2, 2, 3]
# # numbers.uniq

# # # the uniq method removes the repeating items and returns 
# # # the unique items, but it does not mutate the caller.
# # # that means the numbers should be the same as before.

# # puts numbers

# yes!


# what is != and where should you use it?
# ==> it means 'not equal to'. It should be used in conditional statement
# put ! before something, like !user_name
# ==> for any truthy object, !object returns false
# put ! after something, like words.uniq!
# ==> with methods, ! is used for methods that mutate the caller
# put ? before something
# ==> ? generally means that the method returns a boolean
# put ? after something
# put !! before something, like !!user_name

# advice = "Few things in life are as important as house training your pet dinosaur."

# advice.gsub!('important', 'urgent')

# puts advice

# numbers = [1, 2, 3, 4, 5]

# numbers.delete_at(1) # deletes the item at index 1
# numbers.delete(1) # deletes the item 1

# puts numbers

# (11...100).include?(42)

# famous_words = "seven years ago..."

# puts 'Four score and ' << famous_words

# puts 'Four score and ' + famous_words

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.to_a[2]

flintstones.assoc('Barney')
