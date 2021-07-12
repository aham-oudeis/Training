```ruby
=begin
A perfect power is a classification of positive integers:

In mathematics, a perfect power is a positive integer that can be expressed as an integer power of another positive integer. More formally, n is a perfect power if there exist natural numbers m > 1, and k > 1 such that mk = n.

Your task is to check wheter a given integer is a perfect power. If it is a perfect power, return a pair m and k with mk = n as a proof. Otherwise return Nothing, Nil, null, NULL, None or your language's equivalent.

Note: For a perfect power, there might be several pairs. For example 81 = 3^4 = 9^2, so (3,4) and (9,2) are valid solutions. However, the tests take care of this, so if a number is a perfect power, return any pair that proves it.

Input: number
Output: an array with two elements, such that the  first element raised to the power of the second element gives us the number supplied as  an argument.
Rules
1. if there is such number, return nil; that is, [num, 1] would not count. 
2. if the number is zero, return [0, any number]


Examples
isPP(4) => [2,2]
isPP(9) => [3,2]
isPP(5) => nil

5
* iterate through (2..5**(1.0/2).ceil)
* start  another iteraton from 2 that goes up to the point when the result is greater than the given number


Algorithm
1. iterate through (2..num**(1.0/2).ceil)
2. start a loop and a counter set to 2
3. test if the current number from the outer loop raised to the power of the counter gives the argument.
4. if it does, return [current_number, counter]
5. add 1 to the counter and keep the iteration going
5. break the inner loop when the current_num ** counter > given number
6. if the  iteration is complete from step 1, then return nil

=end

def isPP(num)
  limit = (num ** (1.0/2)).ceil
  
  (2..limit).each do |base|
    counter = 2
    loop do 
      total = base ** counter
      return [base, counter] if total == num
      counter += 1
      break if total > num
    end
  end
  nil
end

p isPP(4) == [2,2]
p isPP(9) == [3,2]
p isPP(5) == nil


```

