```ruby
def common_chars(arr)
  common_chars = ''
  arr.first.chars.uniq.each do |char|
    num = arr.map {|str| str.count(char)}.min
    common_chars << char * num
  end

  common_chars.chars
end
```

