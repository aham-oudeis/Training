```ruby
=begin
reverse or rotate

Problem
input: string, integer
	Rules
	1. if the integer is <= 0 or > the length of the string, return ''
	2. chunk the string into size of the integer
	3. for each string, check if the sum of the cubes of its digits is even
	4. if it is even, then reverse the string
	5. else rotate the string to the left

Algorithm
0. define a function to check if. the sum of the cubes of its digits is even.
1. define a function to rotate a string to the left
		str[1..-1] + str[0]
2. slice the string into sizes given and put it in collection(array)
	 	1. iterate through the chars  
		2. append the character to the last element of the array if
				the count is not divisible by 6
		3. if it is divisible, then append it to the array
3. reject the string with size less than the given integer
4. transform the elements of the collection as follows:
		1. if the method in 0 return true
		2. if it returns true, reverse it
		3. if it returns false, rotate it.

5. join the elements and return the string
=end

def sum_cubes_even?(str)
  str.chars.map {|char| (char.to_i)** 3}.sum.even?
end

def rotate(str)
  str[1..-1] + str[0]
end

def conseq_str(str, int)
  count = 0
  str.chars.each_with_object(['']) do |char, arr|
      if count % int == 0
        arr << char
      else
        arr[-1] << char
      end
      count += 1
    end
end

def revrot(str, int)
  collection = conseq_str(str, int)

  collection.reject! {|str| str.length < int}
  
  collection.map! do |str|
  	sum_cubes_even?(str) ?  str.reverse : rotate(str)
  end
  
  collection.join
end
```



