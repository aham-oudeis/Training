=begin
**Problem**
Requirements
-input specifies the length of the number
-output has to specify the first number in the series with that length
-must be able to handle item with large length

Necessities:
-the data has to be structured such that the numbers are orgized by their length? : not necessary
-the function generates the list of fibonacchi numbers up to the given length
-the first one to appear with that length, it returns the index
-the method has to keep a running array of fib nnumbers
-the method must construct the numbers as we go

Algorithm:
-create an arry [1, 1]
-start a loop
  --add the earlier two numbers to generate the next number 
  --put it in the arry
  --break the loop when the number.digits.length equal to given num
-end the loop
-return length - 1 of the array
=end

def find_fibonacci_index_by_length(num)
  fibonacchi_num_arr = [1, 1]
  loop do
    number = fibonacchi_num_arr[-2] + fibonacchi_num_arr[-1]
    fibonacchi_num_arr.push(number)

    break if number.to_s.length == num
  end
  fibonacchi_num_arr.size
end


# def find_fibonacci_index_by_length(num)
#   fib_one = 1
#   fib_two = 1
#   count = 3
#   loop do
#     number = fib_one + fib_two
#     fib_one = fib_two
#     fib_two = number
#     break if number.to_s.length == num
#     count += 1
#   end
#   count
# end


puts find_fibonacci_index_by_length(2) #== 7 
puts find_fibonacci_index_by_length(3) == 12         
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847