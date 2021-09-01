enum = Enumerator.new do |item|
  pointer  = 1
  x = y = 1
  loop do
    item << x
    pointer += 1
    x, y = y, pointer * x
  end
end

p enum.take(7)

p enum.take(7)