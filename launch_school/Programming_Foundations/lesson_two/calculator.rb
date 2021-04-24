def prompt(str)
  Kernel.puts("==> #{str}")
end

def operation_valid()
  command_prompt = <<-MLM
What operation would you like to perform?
    add:        press a 
    substract:  press s 
    multiply:   press m 
    division:   press d
  MLM
  prompt(command_prompt)

  operation = Kernel.gets().chomp()
  return operation if %w(a s m d).include?(operation)
  prompt('Please input a valid operation! Choose a, s, m, or d.')
  operation_valid()
end

def valid_num(oper = 'not d')
  num = Kernel.gets().chomp()
  valid_num_test = (num.to_i.to_s == num) || (num.to_f.to_s == num)

  if valid_num_test
    if oper == 'd' && num.to_i == 0
      prompt("Division by O is not allowed!")
      prompt('Please enter a valid number!')
      return valid_num(oper)
    end

    return num.to_f # be wary of cumulating errors through float conversion

  end

  prompt('Please enter a valid number!')
  valid_num(oper)
end

prompt("What is your name?")
name = gets.chomp
prompt("Hi #{name}! Welcome to the calculator!")

loop do
  operation = operation_valid()

  prompt('Enter the first number!')
  num_first = valid_num()

  prompt('Enter the second number!')
  num_second = valid_num('d')

  result = case operation
           when 'a'
             num_first + num_second
           when 's'
             num_first - num_second
           when 'm'
             num_first * num_second
           else
             num_first / num_second
           end

  doing_what = case operation
               when 'a'
                 'Adding'
               when 's'
                 'Substracting'
               when 'm'
                 'Multiplying'
               else
                 'Dividing'
               end

  prompt("#{doing_what} the two numbers...")
  sleep(1)
  ## to remove the errors introduced by float point,
  ## we can just rounnd the number to 4 decimal places
  prompt("The result is #{result.round(4)}")
  prompt("Do you want to calculate again?
    Press Y to calculate again.")
  response = Kernel.gets().chomp()
  if response.downcase().start_with?('y') == false
    prompt("Thank you for using the calculator. Goodbye!")
    break
  end
end
