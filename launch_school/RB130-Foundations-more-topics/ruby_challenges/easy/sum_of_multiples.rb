module Multiples
  def to(limit)
    multiples_upto(limit).sum
  end

  private

  def multiples_upto(limit)
    numbers.each_with_object([]) do |num, arr|
      gather_multiples(num, arr, limit)
    end
  end

  def gather_multiples(num, arr, limit)
    (1..(limit/2)).each do |mult|
      multiple = num * mult
      break if multiple >= limit
      arr << multiple unless arr.include?(multiple)
    end
  end
end

class SumOfMultiples
  include Multiples
  extend Multiples

  attr_reader :numbers

  def initialize(*args)
    @numbers = args
    # @numbers = (args.empty? ? [3, 5] : args)
  end

  class << self
    def numbers
      [3, 5]
    end
  end
end