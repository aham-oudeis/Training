# what are classes?
classes are outlines/blueprints for what the objects are made up of (state) and what they are able to do (behavior). Classes encapsulate behaviors to be made available for the objects created from them.

# what are objects?
Objects are instantiations of classes. They encapsulate state by storing values in the instance variables.

Object of the same class have the same behaviors but different state.

Different state in the sense that when we change the state of one object, it does not affect the state of another object. Because the instance variables that track the state are scoped at the object level.

# what's their relationship?
-classes provide behaviors for the objects
-objects are instantiations of classes

```ruby
class Student
  def initialize(name)
    @name = name
    @courses = []
    @balance = 0
  end
end

cory = Student.new("Cory Bisel")

p cory
```
