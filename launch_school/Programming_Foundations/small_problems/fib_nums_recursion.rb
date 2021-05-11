# Write a recursive method that computes the nth Fibonacci number, where nth is an argument 
# to the method.

=begin
1 ==> 1
2 ==> 1
3 ==> 2
4 ==> 3
5 ==> 5
6 ==> 8
=end

# fibonacci series is produced by summing up previous two numbers
# let's say in a series of numbers, sum of acc1 and acc2 
# produces the fibonacci number for that position, then we can use
# num, acc1, and acc2 to designate three parts of our equation
# for any given number, its corresponding fibonacci number is 
# a sum of acc1 and acc2. The main difficulty lies in finding a way of 
# breaking down the problem to these three parts.
# for a base case, acc1 = 1, acc2 == 1
# for nth place, the sequence works as follows:
# fibonacci_tal(n, 1, 1)
# fibonacci_tal(n - 1, 1, 2)
# fibonacci_tal(n - 2, 2, 3)
# fibonacci_tal(n - 3, 3, 5)
# fibonacci_tal(n - 4, 5, 8); 
# if n = 6, then (5, 1, 2) ==> (4, 2, 3) ==> (3, 3, 5) ==> (2, 5, 8) 

def fibonacci_tail(num, acc1, acc2)
  return acc2 if num == 1 || num == 2
  fibonacci_tail(num - 1, acc2, acc1 + acc2)
end

def fibonacci(num)
  fibonacci_tail(num, 1, 1)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(9000)
