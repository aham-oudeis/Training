require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 70
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") do
      @cash_register.give_receipt(@transaction)
    end
  end
end