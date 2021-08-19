# what are instance variables
instance variables are scoped at the object level and are available inside of all the instance methods. They are initialized inside of the instance methods.

```ruby
class Student
  def initialize(name)
    @name = name
  end
end
```

# what are class variables
class variables are scoped at the class level and are available throughout the class, subclass, and the instance methods.
```ruby
class People
  @@total = 50

  def  self.total
    @@total
  end
end

p People.total

class Student < People
  @@total = 30
end

p Student.total
p People.total

class Faculty < People
  @@total = 10
end

p Faculty.total
p Student.total
p People.total
```
This kind of counterintuitive behavior is what makes class variables  a bit dangerous to use.

# how are they different?