def fibonacci(n)
  fib = [1, 1]

  3.upto(n) do |_|
    fib = [fib[1], (fib[0] + fib[1])]
  end

  fib[-1]
end

# def fibonacci_last(num)
#   fibonacci(num).to_s[-1].to_i
# end

def fibonacci_last(n)
  last_two_nums = [1, 1]
  #the last digit of a fibonacci number repeats every 60 cycles
  3.upto(n % 60) do
    last_two_nums = [last_two_nums[1] % 10,
                    (last_two_nums[0] + last_two_nums[1]) % 10]
  end

  last_two_nums[1]
end

p fibonacci(3) == 2
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) #== 3
p fibonacci(5) #== 5
p fibonacci(12) == 144
# p fibonacci(20) == 6765
# p fibonacci(123456789)

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
