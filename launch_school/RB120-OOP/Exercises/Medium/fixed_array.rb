# class FixedArray
#   attr_reader :array

#   def initialize(num)
#     @array = [nil] * num
#   end

#   def [](index)
#     array.fetch(index)
#   end

#   def []=(index, item)
#     self[index]
#     array[index] = item
#   end

#   def to_a
#     array.clone
#   end

#   def to_s
#     to_a.inspect
#   end
# end


# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

class FixedArray
  def initialize(size)
    @array = Array.new(size)
  end

  def [](idx)
    raise IndexError.new("You ham-handed potato!") if idx >= @array.size
    @array[idx]
  end

  def []=(idx, value)
    raise IndexError.new("Nope!") if idx < 0 || idx >= @array.size
    @array[idx] = value
  end

  def to_s
    @array.to_s
  end

  def to_a
    @array.dup
  end
end

fixed_array = FixedArray.new(5)

begin
  fixed_array[-7]
  puts false
rescue IndexError
  puts true
end