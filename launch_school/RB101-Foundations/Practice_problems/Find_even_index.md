Find_even_index

``` ruby 
def find_even_index(arr)
  return 0 if arr.empty?
  arr.each_with_index do |num, idx|
    left_side = idx == 0 ? 0 : arr[0..(idx - 1)].sum
    right_side = idx == (arr.size - 1) ? 0: arr[(idx + 1)..].sum
    return idx if  left_side == right_side
  end
  -1
end


p find_even_index([]) == 0

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3

p find_even_index([1, 100, 50, -51, 1, 1]) == 1

p find_even_index([1, 2, 3, 4, 5, 6]) == -1

p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3

p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0

p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6

p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
```

