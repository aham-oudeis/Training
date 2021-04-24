
Kernel.puts(" Welcome to the calculator!\n")

def operation_valid()
  Kernel.puts("What operation would you like to perform?\nadd: a, substract: s, multiply: m, division: d")

  operation = Kernel.gets().chomp()
  return operation if %w(a s m d).include?(operation)
  Kernel.puts("Please input a valid operation!")
  operation_valid()
end

def valid_num()
  num = Kernel.gets().chomp()
  if num.to_i.to_s == num || num.to_f.to_s == num
    # since we are working with floats, multiplications and devision can introduce trailing new numbers. This can go wrong badly if we are looping over the results and cumulating the errors.
    return num.to_f
  end
  Kernel.puts("Please enter a valid number!")
  valid_num()
end

operation = operation_valid()

Kernel.puts("Enter the first number!")
num_first = valid_num()

Kernel.puts("Enter the second number!")
num_second = valid_num()

if operation == 'a'
  result = num_first + num_second
elsif operation == 's'
  result = num_first - num_second
elsif operation == 'm'
  result = num_first * num_second
else
  result = num_first / num_second
end

## to remove the errors introduced by float point, 
## we can just rounnd the number to 4 decimal places
Kernel.puts("The result is #{result.round(4)}")

