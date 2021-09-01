class Octal
  def initialize(octal_num)
    @octal_num = octal_num
  end

  def to_decimal
    not_octal? ? 0 : decimal_value
  end

  def not_octal?
    @octal_num.match?(/[^0-7]/)
  end

  private

  def decimal_value
    digits = @octal_num.to_i.digits
    digits.map.with_index { |digit, index| digit * (8**index) }.sum
  end
end