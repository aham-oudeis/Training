require 'yaml'

MESSAGES = YAML.load_file('calc_messages.yml')

def prompt(str)
  if MESSAGES.include?(str)
    return puts "==> #{MESSAGES[str]}"
  end
  puts "==> #{str}"
end

def valid_num_check
  # cauton: if the number has more than 7 decimal places,
  # float_test returns false.
  num = gets.chomp
  int_test = (num.to_i.to_s == num)
  float_test = (num.to_f.to_s == num)
  valid_num_test = int_test || float_test

  if valid_num_test
    return num.to_r
  end

  prompt('valid_num')
  valid_num_check
end

def monthly_payments(arr)
  loan_amount = arr[0]
  monthly_interest = arr[1]
  loan_duration = arr[2]
  numerator = loan_amount * monthly_interest
  denominator = (1 - (1 + monthly_interest)**(-loan_duration))
  return loan_amount / loan_duration if monthly_interest == 0
  numerator / denominator
end

def ask_loan_amount
  prompt('What is your loan amount?')
  valid_num_check
end

def ask_apr_percent
  prompt('What is your APR in percentage(%)? (omit % sign)')
  apr_percent = Rational(valid_num_check, 100)
  Rational(apr_percent, 12)
end

def ask_loan_duration
  prompt("Lets figure out the loan duration.
    Let's input years first and then months second.")
  prompt("Loan duration in years?")
  loan_duration_years = valid_num_check * 12
  prompt("Remaining months?")
  remaining_months = valid_num_check
  loan_duration_years + remaining_months
end

def mortgage_calculator_params
  loan_amount = ask_loan_amount
  monthly_interest = ask_apr_percent
  loan_duration_months = ask_loan_duration
  [loan_amount, monthly_interest, loan_duration_months]
end

prompt('name')
name = gets.chomp
prompt("Hi #{name.capitalize}! Welcome to Mortgage Calculator!")

loop do
  mortgage_info = mortgage_calculator_params
  result = monthly_payments(mortgage_info).to_f.round(2)
  prompt('calc') # unnecessary step 
  sleep(1)  # unnecessary step, dramatic pause
  prompt("Your monthly interest payment is: #{result}")

  prompt("Do you want to calculate again?
    Press Y to calculate again.")
  response = gets.chomp

  if response.downcase().start_with?('y') == false
    prompt("Thank you for using the mortgage calculator. Goodbye!")
    break
  end
end
