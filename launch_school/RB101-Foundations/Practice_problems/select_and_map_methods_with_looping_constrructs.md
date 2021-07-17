`select` and `map` methods with looping constrructs

```ruby
def select_fruit(hash)
  arr = hash.to_a
  selected_arr = []
  count = 0
  loop do 
    selected_arr << arr[count] if arr[count].last == 'Fruit'
  
    count += 1
    break if count == hash.size
  end
  selected_arr.to_h
end

def select_fruit(hash)
  keys = hash.keys
  selected_hash = {}
  count = 0
  loop do 
    current_key = keys[count]
    corresponding_value = hash[current_key]
    selected_hash[current_key] = corresponding_value if corresponding_value == 'Fruit'
 
    count += 1
    break if count == keys.size
  end
  selected_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}
```

 Implementing an in-place transformation of an array

```ruby
def double_numbers!(arr)
  arr_copy = arr.dup
  size = arr_copy.size
  counter = 0
  
  loop do
    doubled_element = arr_copy[counter] * 2
    arr.push(doubled_element)
    arr.shift
    counter += 1
    break if counter == size
  end
  return arr
end

def double_numbers!(arr)
  (arr.size).times { |_| arr.push(arr.first * 2).shift }
  return arr
end

def double_numbers!(arr)
  (arr.size).times { |i| arr[i] *= 2 }
  return arr
end
```

Multiply method

```ruby
def multiply(arr, num)
  new_arr
  (arr.size).times { |i| new_arr[i] = arr[i] * num }
  return new_arr
end
```

Select letter method

```ruby
def select_letter(string, letter)
  selected_letters = ''
  (string.size).times {|i| selected_letters << string[i] if string[i] == letter}
  selected_letters
end
```

select letter count method

```ruby
def count_select_letter(string, letter)
  count = 0
  (string.size).times {|i| count += 1 if string[i] == letter}
  count
end
```

