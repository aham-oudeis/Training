```ruby
=begin
next bigger number
=end

def next_bigger_number(int)
  num = int + 1
  digits = int.digits.reverse
  return -1 if digits.sort.reverse == digits
  
  while num.digits.sort != int.digits.sort
    num = num.next
  end
  num
end
```

