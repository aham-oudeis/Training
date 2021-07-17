```ruby
# cute angles

def dms(num)
  degree, minutes = num.divmod(1)
  minutes, seconds = (minutes * 60).divmod(1)
  seconds = (seconds * 60).to_i
  
  format("%01d#{"\xC2\xB0"}%02d#{"'"}%02d#{"\""}", degree, minutes, seconds)
end

# delete vowels

def remove_vowels(arr)
  arr.map {|str| str.delete('aeiouAEIOU')}
end

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Fibonacci Number

def find_fibonacci_index_by_length(num)
  first, second = 1, 1
  
  index = 2
  loop do 
    break if second.to_s.length == num
    first, second = second, first + second
    index += 1
  end
  index
end

# Reversed Arrays (Part 1)

def reverse!(arr)
  reversed = 
  	arr.each_with_object([]) do |el, arr|
    	arr.unshift(el)
  	end
  
  arr.replace(reversed)
end

def reverse!(arr)
  reversed = 
  	arr.each_with_object([]) do |el, arr|
    	arr.prepend(el)
  	end
  
  arr.replace(reversed)
end

def reverse!(arr)
  left_idx = 0
  right_idx = -1
  
  while right_idx.abs < arr.size / 2
    arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
    left_idx += 1
    right_idx -= 1
  end
end

# Combining Arrays

def merge(arr1, arr2)
  arr1 | arr2
end
    
# Halvsies

def halvsies(arr)
  size = arr.size
  return [[],[]] if arr.size == 0
  return [arr, []] if arr.size == 1
  half = size.odd? ? 1 + (size / 2) : size / 2
  arr.each_slice(half).to_a
end

def halvsies(arr)
  size = arr.size
  half = size.odd? ? 1 + (size / 2) : size / 2
  first_slice = arr[0...half]
  second_slice = arr[half..-1]
  [first_slice, second_slice]
end

# Does my list include this?

def include?(arr, item)
  arr.each {|el| return true if el == item}
  false
  # !!arr.find_index(item) 
  # !arr.select{|el| el == item}.empty?
end

# Right Triangles

def triangle(num)
  puts
  # to change where the right angle is positioned, 
  # change rjust to ljust or the method call from #upto to #downto
  1.upto(num) {|i| ('*' * i).rjust(num)}
  puts
end
```

