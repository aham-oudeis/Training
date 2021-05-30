kebabize

```ruby
def kebabize(camelcase)
  chars = camelcase.chars.select {|char| char.match?(/[A-Za-z]/)}
  chars.map {|i| capitalized?(i) ? "-#{i.downcase}" : i }.join
end

def capitalized?(letter)
  letter.upcase == letter
end
```

Stop_spinning_my_words

```ruby
def spin_words(str)
  words_arr = str.split
  
  words_arr.map {|word| word.length >  4 ? word.reverse: word }.join(" ")
end
```

Expanded_form

```ruby
def expanded_form(int)
  int.digits.map.with_index { |num, idx| num * (10**idx) }.reject(&:zero?).reverse.join(' + ')
end
```

Persistence_bugger

```ruby
def persistence(num)
  count = 0
  loop do
    break if num < 10
    num = num.digits.reduce(&:*)
    count += 1
  end
  count
end
```

