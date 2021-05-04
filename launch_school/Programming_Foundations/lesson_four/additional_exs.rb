# turn into a hash with values as the keys and index as the value
# create a hash 
# loop through the array
# assign each item of the array as the hash key
# assign the idex of the item to the hash value
# use each_with_object method

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# flintstones_to_hash = flintstones.each_with_object({}) do |item, hash|
#    hash[item] = flintstones.index(item)
# end

# p flintstones_to_hash

# new_hash = {}

# flintstones.each_with_index {|item, idx| new_hash[item] = idx}

# puts new_hash

# add up all the ages 

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p ages.values.reduce(:+)

# ages.select do |k, v|
#   v <= 100
# end

# p ages

# ages.reject! do |k, v|
#     v > 100
# end

# p ages

# p ages.values.min

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.index {|item| item.start_with?('Be')}

# # shorten the names without modifyng the original array
# p flintstones.map {|i| i[0, 3]}

# statement = "The Flintstones Rock"

# selection_proc = proc {|char| ('a'..'z').include?(char.downcase)}
# # all_chars = statement.chars.select(&selection_proc) 
# # freq_hash = all_chars.uniq.each_with_object({}) do |char, hash|
# #   hash[char] = all_chars.count(char)
# # end

# uniq_chars = statement.chars.uniq.select(&selection_proc)

# freq_hash = uniq_chars.each_with_object({}) do |char, hash|
#   hash[char] = statement.scan(char).count
# end

# p freq_hash

# Problem
# take a nest hash and modify it according to the given rules
# 0-17: kid, 18-64: adult, 65+: old
# access the values in the nest hash
# evaluate the values
# depending on the values, create a new key: value pair
# loop through the hash, and for each key, 
# test if the value of the age key
# the main difficulty lies in accessing a nested hash 
# and adding items to it

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |_, inner_hash|
  age_is = inner_hash['age']

  if age_is.between?(0, 17)
    inner_hash['age_group'] = 'kid'
  elsif age_is.between?(18, 64)
    inner_hash['age_group'] = 'adult'
  else
    inner_hash['age_group'] = 'senior'
  end
end


p munsters['Eddie']