```ruby
NUM_WORDS = %w(zero one two three four five six seven eight nine)
NUMS = (0..9).to_a

OPER_WORDS = %W(plus minus times divided_by)
OPERANDS = %i(+ - * /)

TRANSLATE = (NUM_WORDS + OPER_WORDS).zip(NUMS + OPERANDS).to_h
def evaluate(str)
  statment = 
    str.scan(/[a-z_]+/i).map do |oper|
      TRANSLATE[oper]
    end.join
  eval(statement)
end

```



