def compute
  block_given? ? yield : "Does not compute"
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further exploration

def compute(num)
  return "Does not compute." unless block_given?
  yield(num)
end

p compute(5) { |num| num ** 2 }
p compute("Hello") { |string| string + ", world!" }
p compute([1, 2, 3]) { |arr| arr.map(&:to_f)}
p compute(100)