items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, flour|
  puts produce.join(", ")
  puts flour
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
puts
gather(items) do |fruit, *vegetables, flour|
  puts fruit
  puts vegetables.join(", ")
  puts flour
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!
puts
gather(items) do |fruit, *others|
  puts fruit
  puts others.join(", ")
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!
puts
gather(items) do |apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage}, and #{wheat}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!