__States and Behaviors__

When defining a class we generally focus on two things: _states_ and _behaviors_. States track attributes for individual objects and behaviors are what objects are capable of doing.

In other words, the objects will have predefined set of attributes (the ones that are specified in the class). The state of the object is simply a set of the attributes. Behaviors are  methods these attributes respond to in different ways. 

Instance variables are the ones that keep track of these distinct attributes.

> This should tell you that instance variables are scoped at the object  (or instance) level, and are how objects keep track of their states.

That is, for each object instantiated from a class there are these predefined set of instance variables. Different instance variables pertain to different attributes of the object. The instance variable for one object does not interact with the instance variable for another object. These instance variables are scoped at the object level. 

In a loose way of talking, instance variables are internal trackers of the information associated with the object. For each object, these instance variables are pointers for the information; and what kind of information they carry is specified when we create that class object.

> In summary, instance variables keep track of state, and instance methods expose behavior for objects. 

An implication of this is that the information carried by the instance variables are exposed through method invocation defined in the class.

__Initializing a New Object__

```ruby
class GoodDog
  def initialize
    puts "This object is initialized!"
  end
end

sparky = GoodDog.new
```

Here, the `new` is a class method that we call on the class `GoodDog` that triggers the instance method `initialize`. The `initialize` method is a special method. It would not be triggered if the method name was somethinig different. This special `initialize` method is called the _constructor_.

* (A little quirk to be aware of) Setter methods always return the value that is passed in as an argument.

Typing along

```ruby
class GoodDog
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak

puts sparky.name # => "Sparky"
sparky.name = "Spartacus"

puts sparky.name # => "Spartacus"

## Accesssor Methods in Action

def speak
  "#{@name} says arf!"
end

def speak
  "#{name} says arf!"
end

## instead of accessing the instance variable, we invoke the name method

```

> Why do this? Why not just reference the `@name` instance  variable, like we did before? Technically, you could just reference the  instance variable, but it's generally a good idea to call the *getter* method instead.

* We can have a built-in customization of what is being displayed.
* we don't always want to work with the full information that the instance variable carries with it

```ruby
class GoodDog
  attr_accessor :name, :height, :weight
  
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end
  
  def speak
    "#{name} says arf!"
  end
  
  def change_info(n, h, w)
    @name = n
    @height = h
    @weight = w
  end
  
  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

```

However, if we change the setter method by invoking simply the method call, it would not work

```ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end
=begin
just like changing @name to the method invocation name, we are attempting to use the 
method invocation to change the info stored in the local variable
the idea is that we might expect line 2 to trigger the method call `name=(n)`
but it does not, because Ruby does not recognize line 2 as a method call on the same
object; rather, Ruby sees it as local variable assignment;
we have to be clear about it and add self
=end

# the following specification works

def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end

# here, the self invocation specifies that we are calling the name method
# on the calling object.
# to be consistent, (although it is not, strictly speaking, necessary) we can use self.name in our getter method as well
```



Exercises

```ruby
class MyCar
  attr_accessor :color
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end
  
  def current_speed
    puts "The current speed is #{@speed}"
  end
  
  def speed_up(num)
    @speed += num
  end
  
  def brake(num)
    @speed -= num
  end
  
  def stop
    @speed = 0
  end
end
  
```

