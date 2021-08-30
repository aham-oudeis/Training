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

  def test_accept_money
    @cash_register.accept_money(@transaction)
    assert_equal(100 + 70, @cash_register.total_money)
  end

  def test_change_money
    assert_equal(20, @cash_register.change(@transaction))
  end
end