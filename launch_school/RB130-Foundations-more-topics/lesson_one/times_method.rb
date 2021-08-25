# Times method

5.times do |i|
  puts "#{i}. Hello"
end

# Takes in the block and the starting number is 0
# the last number is one less than the calling object
# returns the calling object

# custom times method

def times(num)
  counter = 0

  while counter < num do
    yield(counter)
    counter += 1
  end

  num # return the calling object
end

# def times(num)
#   for i in (0...num)
#     yield(i)
#   end
#
#   num
# end

puts "\nCustom Times Method"
puts

times(5) do |i|
  puts "#{i}. Hello"
end
