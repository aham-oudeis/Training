require 'minitest/autorun'
require 'minitest/reporters'
require 'stringio'
Minitest::Reporters.use!

# require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 70
  end

  def test_prompt_payment
    item_cost = @transaction.item_cost
    input = StringIO.new("100\n")
    output = StringIO.new
    output_enough = "You owe $#{item_cost}.\nHow much are you paying?"
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal 100, @transaction.amount_paid
  end
end