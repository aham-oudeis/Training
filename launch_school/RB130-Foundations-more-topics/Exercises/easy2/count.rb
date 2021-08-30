# def count(*args)
#   args.select { |item| yield(item)}.size
# end

def count(*args)
  args.reduce(0) do |total, item|
    value = (yield(item) ? 1 : 0)
    total += value
  end
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
