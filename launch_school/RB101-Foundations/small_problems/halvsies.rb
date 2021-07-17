def halvsies(arr)
  half = arr.length / 2
  half_idx = arr.length.odd? ? half + 1 : half

  first_half = arr[...half_idx] # slicing excluding the half_idx element
  sec_half = arr[half_idx..] # slicing including the half_idx element

  [first_half, sec_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]