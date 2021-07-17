```ruby
# Arithmetic Integer

def prompt(str)
  puts "=> #{str}"
end

prompt "Enter the first number:"
first_num = gets.chomp.to_i
prompt "Enter the second number:"
second_num = gets.chomp.to_i

opers = %w(+ - * / % **)
opers.each do |oper|
  exp = "#{first_num} #{oper} #{second_num}"
  prompt "#{exp} is #{eval(exp)}"
end

# Counting the Number of Charracters

puts "Please write a word or multiple words."
input = gets.chomp.strip

length = input.delete(' ').size

puts "There are #{length} character in \"#{input}\"."

# Exclusive Or

def xor?(bool1, bool2)
  [bool1, bool2].count(true) == 1
end

# Odd lists

def oddities(arr)
  arr.select.with_index |_, idx|
    idx.even?
	end
end

def oddities(arr)
  arr.each_with_object([]).with_index do |(el, arr), idx|
    arr << el if idx.even?
	end
end

def oddities(arr)
  arr.select.with_index |_, idx|
    idx.even?
	end
end

# Palindromic Strings (Part 1)
def reverse(str)
  chars = str.chars
  (1..chars.size).each_with_object('') do |_, str|
		str << chars.pop
  end
end

def reverse(str)
  str.size == 1 ? str : str[-1] + reverse(str[0..-2])
end

def palindrome?(str)
 str == reverse(str)
end

# Palindromic Strings (Part 2)

def real_palindrome?(str)
  alpha_numeric_chars = ('a'..'z').to_a | (0..9).to_a
  test_chars = 
  	str.downcase.chars.select do |char|
    	alpha_numeric_chars .include?(char)
  	end
  palindrome?(test_chars.join)
end

def real_palindrome?(str)
  test_str = str.downcase.delete('^a-z0-9')
  palindrome?(test_str)
end
```

