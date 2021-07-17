```ruby
def max_subsequence(arr)
  sum = 0

  arr.each_with_object([0]) do |num, sums_arr|
    sum = sum + num
		sum = 0 if sum < 0
    
    sums_arr << sum if sum > 0
  end.max
end
```



```ruby
def common_prefix(arr)
  count = 1
  loop do 
  	test = arr.all? {|string| string[0, count] == arr.first[0, count]}
    test ? count += 1 : break
  end
   arr.first[0, count - 1]
end
```

