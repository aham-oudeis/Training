# def include?(arr, item)
#   arr.select {|i| i == item}.size != 0
# end

def include?(arr, item)
  arr.find_index(item) != nil
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false