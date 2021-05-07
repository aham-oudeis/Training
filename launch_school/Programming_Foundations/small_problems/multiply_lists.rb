# def multiply_list(arr1, arr2)
#   [arr1, arr2].transpose.map {|a| a[0] * a[1]}.flatten
# end

def multiply_list(arr1, arr2)
  [arr1, arr2].transpose.map {|nested_array| nested_array.reduce(:*)}
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]