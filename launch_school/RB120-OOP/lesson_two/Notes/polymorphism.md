### Polymorphism

Polymorphism refers to the ability of data or objects of different types to respond to the same message or method or a common interface. The idea is that as long as an object responds to the same method call or operation, then it doesn't matter how the responses are different.

Although polymorphism is often implemented with inheritance, it is not strictly necessary. That is, there are other ways of implementing polymorphism. Like, the usage of modules?

#### Polymorphism through inheritance

```ruby
class Animal
  def move
  end
end

class Fish < Animal
  def move
    puts "swim"
  end
end

class Cat < Animal
  def move
    puts "walk"
  end
end

# Sponges and Corals don't have a separate move method - they don't move
class Sponge < Animal; end
class Coral < Animal; end

animals = [Fish.new, Cat.new, Sponge.new, Coral.new]
animals.each { |animal| animal.move }
```



In this example, in line 23 we invoke the `move` method on each animal element from the list of animals. Not all the elements respond to the `move` method in the same way. They may have similar responses, but they can have different ones as well. They can have quite different implementations, but as long as they all respond to the same method, we can call the same method on each object. The objects may have some commonality in their class heirarchy and for that reason the method implementations might be slighly differrent. In some way, the objects may have some common superclass. In such cases, the difference in method implementation comes about because of __overriding__. (Duck typing is slightly different, because in that case the objects may share a method without having any common superclass.) The ability to treat objects with various different implementations as if they were one kind of object is what is known as polymorphism. The ability to deal with many forms. 

* Inheriting methods
* Overriding methods
* Duck typing

##### Polymorphism through Duck Typing

> **Duck typing** occurs when objects of different *unrelated* types both respond to the same method name. With duck typing, we aren't concerned with the class or type of an object, but we do care whether  an object has a particular behavior. *If an object quacks like a duck, then we can treat it as a duck.* Specifically, duck typing is a form of polymorphism. As long as the  objects involved use the same method name and take the same number of  arguments, we can treat the object as belonging to a specific category  of objects.

Polymorphism allows us to eliminate many kinds of dependencies that would otherwise be needed.

> Note that merely having two different objects that have a method with  the same name and compatible arguments doesn't mean that you have  polymorphism. In theory, those methods might be used polymorphically,  but that doesn't always make sense. Consider the following two classes:

```ruby
class Circle
  def draw; end
end

class Blinds
  def draw; end
end

[Circle.new, Blinds.new].each { |obj| obj.draw }
```

Although it looks like polymorphism, it isn't. 

> In practice, polymorphic methods are intentionally designed to be  polymorphic; if there's no intention, you probably shouldn't use them  polymorphically.

