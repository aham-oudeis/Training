# def sum_of_sums(arr)
#   sum_arr = []
#   sum = 0
#   arr.each_with_index do |e, i|
#     sum += e
#     sum_arr[i] = sum
#   end
#   sum_arr.sum
# end

def sum_of_sums(arr)
  arr.size <= 1 ? arr.sum : (sum_of_sums(arr[..-2]) + arr.sum)
end

p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([])
p sum_of_sums([1, 2, 3, 4, 5]) == 35