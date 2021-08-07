### Fake operators

Except for `.` `::`, `ternary operator`, and the logical operators, most of what seem like operators are in fact methods defined for that particular object.

For instance, when we write `'abc' == 'abcd'` in ruby, we are not using an operator but a method call defined in the String class.

What this does is compare if the two objects have the same value.

However, when we invoke the same equivalence method for our custom objects without defining == for the custom class, the method Ruby finds is from BasicObject, which returns true only if they are the same object, not if the two objects have the same value.

We would implement a fake operator in a custom class to give the desired behavior for the custom objects, in contrast to the default behavior available to the object or because no such behavior is available to the object.

```ruby
class Mountain
  attr_reader :name, :height
  def initialize(name, height)
    @name = name.capitalize
    @height = height
  end
end

sanitas = Mountain.new('Sanitas', 1129)
evans = Mountai.new('Evans', 1440)

puts "Sanitas is smaller than Evans" if evans > sanitas

# Here, since we have not defined how to compare object with the other
# it would throw a NoMethod error.
# in order to allow for such comparision, we can add the following instance method:

class Mountain
	def >(other)
    height > other.height
  end
end

# Now we would get the desired result.
```