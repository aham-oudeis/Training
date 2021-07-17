require 'yaml'

MESSAGES = YAML.load_file('calc_messages.yml')

def prompt(str)
  if MESSAGES.include?(str)
    return puts "==> #{MESSAGES[str]}"
  end
  puts "==> #{str}"
end

def operation_valid
  prompt 'command_prompt'

  operation = gets.chomp
  return operation if %w(a s m d).include?(operation)
  prompt('valid_num')
  operation_valid
end

def valid_num(oper = 'not d')
  num = gets.chomp
  valid_num_test = (num.to_i.to_s == num) || (num.to_f.to_s == num)

  if valid_num_test
    if oper == 'd' && num.to_i == 0
      prompt('no_zero_div')
      prompt('valid_num')
      return valid_num(oper)
    end

    return num.to_f # be wary of cumulating errors through float conversion
  end

  prompt('valid_num')
  valid_num(oper)
end

def result(arr)
  operation = arr[0]
  num_first = arr[1]
  num_second = arr[2]
  case operation
  when 'a'
    num_first + num_second
  when 's'
    num_first - num_second
  when 'm'
    num_first * num_second
  else
    num_first / num_second
  end
end

def process(operation)
  case operation
  when 'a'
    prompt('add')
  when 's'
    prompt('subs')
  when 'm'
    prompt('mult')
  else
    prompt('divd')
  end
end

prompt('name')
name = gets.chomp
prompt("Hi #{name.capitalize}!")
prompt('welcome')

loop do
  operation = operation_valid()

  prompt('first_num')
  num_first = valid_num()

  prompt('second_num')
  num_second = valid_num('d')

  to_be_done = [operation, num_first, num_second]

  result = result(to_be_done)

  process(operation)
  sleep(1)
  ## to remove the errors introduced by float point,
  ## we can just rounnd the number to 4 decimal places
  prompt("The result is #{result.round(4)}")
  prompt('repeat_again?')
  response = gets.chomp
  if response.downcase().start_with?('y') == false
    prompt('thank_you')
    break
  end
end
