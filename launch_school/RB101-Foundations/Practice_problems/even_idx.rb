def max_sequence(arr)
  sum = 0
  arr.each_with_object([0]) do |item, arr|
    sum += item
    sum = sum < 0 ? 0 : sum

    arr << sum unless arr.include?(sum)
  end.max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
