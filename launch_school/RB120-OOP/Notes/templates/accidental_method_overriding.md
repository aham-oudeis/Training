### Accidental Method Overriding

Accidental method overriding occurs when we define an instance method for our custom object overriding the method defined in the inheritance heirarchy. The problem with the accidental  method overriding is that it affects all the code that rely on the method from the superclass.

This happens accidentaally when we are not quite aware of the methods defined in the superclass.

The overriding happens because Ruby looks for the method of the same name and executes the first one it finds in the method look up path. One example is as follows:

```ruby
class PlayNumbers
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def str
    format("%02d", num)
  end

  # def send
  #   num.to_s(2)
  # end
end

a = PlayNumbers.new(9)
b = PlayNumbers.new(11)

p a.send :str
```