# def merge(arr1, arr2)
#   (arr1 + arr2).uniq
# end

# def merge(arr1, arr2)
#   temp_arr = []
#   arr1.each {|i| temp_arr.push(i) if !temp_arr.include?(i)}
#   arr2.each {|i| temp_arr.push(i) if !temp_arr.include?(i)}
#   temp_arr
# end

def merge(arr1, arr2)
  arr1 | arr2
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]