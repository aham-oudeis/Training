__Inheritance__

Inheritance is when a class __inherits__ behavior from another class. The class that is inheriting behavior is called the __subclass__ and the class it inherits from is called the __superclass__.

We can use inheritance to extract common behaviors from classes that share that behavior and move it to a superclass. It's like having a lot of common behaviors between arrays and hashes to the enumerable superclass.

__class inheritance__

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal # the class GoodDog inherits from the Animal superclass
end

class Cat < Animal
end

sparky = GoodDog.new #instantiaion of GoodDog class
paws = Cat.new #instantiaion of Cat class

puts sparky.speak #=> Hello
puts paws.speak #=> Hello
```

Here the symbol < signifes the inheritance relation. Cat < Animal means the class Cat inherits all the methods from the superclass Animal. 

If the object's class already contains the method, then it uses the first method it finds before checking the superclass

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def speak
    "#{self.name} says Arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak # it should return the string: Sparky says Arf!
puts paws.speak # it should return the string: Hello!
```

