class RomanNumeral
  ROMAN_CONVERSION =
  { 1000=>"M",
    900=>"CM",
    500=>"D",
    400=>"CD",
    100=>"C",
    90=>"XC",
    50=>"L",
    40=>"XL",
    10=>"X",
    9=>"IX",
    5=>"V",
    4=>"IV",
    1=>"I" }

  def initialize(num)
    @number = num
  end

  # def to_roman
  #   number = @number

  #   ROMAN_CONVERSION.each_with_object("") do |(base, value), string|
  #     multiple, number = number.divmod(base)
  #     next if multiple.zero?
  #     string << value * multiple
  #   end
  # end

  def to_roman
    # to make the method independent of hash's order
    number = @number
    descending_keys = ROMAN_CONVERSION.keys.sort.reverse
    descending_keys.each_with_object("") do |base, string|
      multiple, number = number.divmod(base)
      next if multiple.zero?
      string << ROMAN_CONVERSION[base] * multiple
    end
  end
end

p RomanNumeral.new(575).to_roman
=begin
1 => I
2 => II
3 => III
4 => IV
5 => V

21 / 10 -> 2, 1

=end