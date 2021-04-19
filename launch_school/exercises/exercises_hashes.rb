# 9

h = {a: 1, b: 2, c: 3, d: 4}

p h[:b]

h[:e] = 5

p h[:e]

h.delete_if {|k, v| v < 3.5}

p h

# 10 yes, yes

# 11

contact_data = [["joe@email.com", "123 Main St", "555-1223-4567"],["sally@email.com", "404 Not Found Dr.", "123-223-2492"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

temp_key = [:email, :address, :phone]

# map the keys from temp_key to the items in 
# contact_data and mutates the original array

contact_data_hash = contact_data.map {|i| temp_key.zip(i).to_h}

# p contact_data

# looping through the hash contacts
# and taking the key and taking the first name
for k, v in contacts
  name = k.split(" ")[0].downcase
  # then looping though the array contact_data_hash
  # to find the right match
  for item in contact_data_hash
    # if the name matches the array item
    # assign the item to the contacts key that 
    # matches
    if item[:email].include?(name)
      contacts[k] = item
    end
  end
end

p contacts["Joe Smith"][:email]

