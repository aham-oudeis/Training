# def map(arr)
#   arr.each_with_object([]) do |item, collection|
#     collection << yield(item)
#   end
# end

# def map(arr)
#   arr.reduce([]) do  |collection, item|
#     collection += [yield(item)]
#   end
# end

def map(arr)
  collection = []
  for item in arr
    collection += [yield(item)]
  end
  collection
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]