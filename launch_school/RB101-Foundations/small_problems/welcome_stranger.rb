def greetings(arr, hash)
  p "Hello, #{arr.join(' ')}! Nice to have a"\
  "#{hash[:title]} #{hash[:occupation]} around!"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.