# def each_cons(arr)
#   (0...(arr.size - 1)).each do |index|
#     yield(arr[index], arr[index + 1])
#   end
#   nil
# end

def each_cons(arr)
  (0...(arr.size - 1)).each do |index|
    upto = index + 1
    yield(arr[index..upto])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil