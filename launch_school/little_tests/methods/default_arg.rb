# def car(x, y)
#   x + " " + y
# end

# puts car('Toyota', 'Corolla')

# def time_of_day(bool)
#   bool ? "It's daytime!" : "It's nighttime!"
# end

# daylight = [true, false].sample

# puts time_of_day(daylight)

    
# def dog(name)
#   return name
# end

# def cat
#   return "Ginger"
# end

# puts "The dog's name is #{dog('Spot')}."
# puts "The cat's name is #{cat}."

def assign_name(name="Bob")
  name
end

puts assign_name('Kevin') == 'Kevin'
puts assign_name == 'Bob'