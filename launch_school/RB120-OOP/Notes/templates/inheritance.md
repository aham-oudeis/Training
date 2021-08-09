### Inheritance

Inheritance is when a class __inherits__ behavior from another class. The class that is inheriting behavior is called the __subclass__ and the class it inherits from is called the __superclass__.

We can use inheritance to extract common behaviors from classes that share that behavior and move it to a superclass. That means, inheritance is a way to implement the DRY principle. (Another being module.)

It's like having a lot of common behaviors between arrays and hashes in the enumerable module (that's interface inheritance), or in the Object class (class inheritance).

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

Here the sign `<` signifes the inheritance relation. `Cat < Animal` means the class Cat inherits all the methods (both instance methods and class methods) from the superclass Animal.