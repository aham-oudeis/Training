require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative('text.rb')

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample.txt')
    @text_string = @file.read
    @text = Text.new(@text_string)
  end

  def test_swap_letters
    count_a_prior = @text_string.count('a')
    count_e_prior = @text_string.count('e')
    new_text = @text.swap('a', 'e')
    count_e_after = new_text.count('e')
    count_a_after = new_text.count('a')

    assert_equal(0, count_a_after)
    assert_equal(count_a_prior + count_e_prior, count_e_after)
  end

  def teardown
    @file.close
  end
end