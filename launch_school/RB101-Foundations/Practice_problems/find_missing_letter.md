```ruby
def find_missing_letter(array)
  first, last = array.minmax
  
  (first..last).each { |letter| return letter if !array.include?(letter) }
  end
end

def find_missing_letter(array)
  first, last = array.minmax
  ((first..last).to_a - array).pop
end

def find_missing_letter(array)
  letter = array.min.next
  loop do
    return letter if !array.include?(letter)
    letter = letter.next
  end
end
```

