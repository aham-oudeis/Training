# def missing(arr)
#   (arr.first..arr.last).to_a - arr
# end

def missing(arr)
  (arr.first..arr.last).each_with_object([]) do |item, collection|
    collection << item unless arr.include?(item)
  end
end

p missing([1, 2, 3, 4]) == []
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []