class PerfectNumber
  def self.classify(num)
    PerfectNumber.new(num).classify
  end

  def initialize(num)
    raise StandardError unless num >  0
    @number = num
  end

  def classify
    case divisors.sum <=> @number
    when 0  then 'perfect'
    when -1 then 'deficient'
    when 1  then 'abundant'
    end
  end

  private

  def divisors
    first_half = (1..(@number**(1.0/2))).select { |num| divisor?(num)}
    second_half = first_half.reverse.map { |num| @number / num}
    (first_half | second_half) - [@number]
  end

  def divisor?(num)
    @number % num == 0
  end
end
