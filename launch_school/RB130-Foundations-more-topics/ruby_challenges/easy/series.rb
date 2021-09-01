class Series
  def initialize(string)
    @string = string
  end

  def slices(num)
    raise ArgumentError unless num <= @string.size
    digits = @string.chars.map(&:to_i)
    each_cons(digits, num)
    # digits.each_cons(num).to_a
  end

  def each_cons(arr, num)
    last_index = arr.size - num
    (0..last_index).each_with_object([]) do |index, obj|
      obj << arr.slice(index, num)
    end
  end
end