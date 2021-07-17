=begin
Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.
=end

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p (arr.map do |nest_arr|
    nest_arr.select {|int| int % 3 == 0}
end)

p (arr.each_with_object([]) do |nest_arr, array|
      array << (nest_arr.select {|int| int % 3 == 0})
end)