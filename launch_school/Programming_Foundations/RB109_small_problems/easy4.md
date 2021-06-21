```ruby
# short long short

def short_long_short(str1, str2)
  str1, str2 = [str1, str2].minmax
  str1 + str2 + str1
end

def short_long_short(str1, str2)
  str1, str2 = [str1, str2].minmax if str1.length != str2.length  
  str1 + str2 + str1
end

# What century is that?

def century(num)
  rough_estimate = num / 100
  century = num % 100 == 0 ? rough_estimate : rough_estimate + 1
  century_str = century.to_s
  last_two = century_str[-2..-1]
  
  suffix = %w(1 2 3).zip(%w(st nd rd)).to_h
  suffix.default = 'th'
  
  if century < 10
    century_str + suffix[century_str[-1]]
  elsif last_two <= 20 &&  last_two >= '3'
    century_str + 'th'
  else
    century_str + suffix[century_str[-1]]
  end
end

# Multiples of 3 and 5

def multisum(num)
  (1..num).each_with_object([]) do |num, arr|
    arr << num if num % 3 == 0 || num % 5 == 0
  end.sum
end

def multisum(num)
  (1..num).inject(0) do |sum, num|
    test = num % 3 == 0 || num % 5 == 0
    test ? sum + num : sum
  end
end

# Running Totals

def running_total(arr)
  sum = 0
  arr.each_with_object([]) do |num, arr|
    arr << sum += num 
  end
end


def running_total(arr)
  sum = 0
  arr.map { |num| sum += num }
end

# Convert a String to an Integer
CONVERSION = ('0'..'9').zip((0..9)).to_h
def string_to_integer(str)
  total = 0
  str.reverse.chars.each_with_index do |char, idx|
    num = CONVERSION[char] * (10**idx)
    total += num
  end
  total
end

def string_to_integer(str)
  count = 0
  str.reverse.chars.inject(0) do |sum, char|
    num = CONVERSION[char] * (10**count)
    count += 1
    sum + num
  end
end

# Convert a String to Signed Integer

def string_to_signed_integer(str)
	nums = str.chars.select {|char| ('0'..'9').include?(char)}
  
  count = 0
  number = 
    nums.reverse.inject(0) do |sum, char|
      num = CONVERSION[char] * (10**count)
      count += 1
      sum + num
    end
  
  str[0] == '-' ? -number : number
end

# Convert a number to a string
CONVERSION = (0..9).zip(('0'..'9')).to_h

def integer_to_string(num)
  str = ''
  return '0' if num == 0
  while num != 0
  	num, to_add = num.divmod(10)
    
    str << CONVERSION[to_add]
  end
  str.reverse
end

# Convert a signed number to a string

def signed_integer_to_string(num)
  positive = num.abs
  return '0' if num == 0
  prefix = num < 0 ? '-' : '+'
  prefix + integer_to_string(positive)
end


```

