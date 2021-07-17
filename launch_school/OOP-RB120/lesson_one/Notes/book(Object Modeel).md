<!-- What is OOP --> 

OOP (Object Oriented Programming) is a programming paradigm that was proposed to solve the problem of growing complexity in the code and the resultant difficulty of maintaining code. The specific difficulty has to do with the increse in dependencies in the program.

Problem: if one piece of code is changed, there is a ripple effect throughtout the whole program; this is burdensome for the purpose of maintaining code. 

OOP seeks to solve this problem.

__Encapsulation__ 

hiding pieces of functionality and making it unavailable to other parts of the code base. It is a form of data protection so that the data cannot be manipulated without obvious intent. (Is the problem unintentional alteration of the data or that of unrecognized side-effects?)

Ruby does this by creating objects and exposing interfaces (methods) with those objects. In what way are the objects related to the methods? Is it simply that the methods are specified in the parent class? What about the class methods? (What are other ways of doing this? Could functional programming be a way of dealing with this problem? Maybe the problem of side-effects?)

__Polymorphism__

It refers to the ability of different types of data to interact with common interface (methods). 

I understand it to mean we can call the same methods on different kinds of data. For instance, we can call `to_s` on an integer or an array object. Although integer objects are quite different from array objects, they are both responsive to `to_s`. This is a kind of polymorphism. (we will see if this hypothesis is correct.)

The basic idea here is that the same method can be made available to different objects. However, the mere fact that the same method is available to different objects does not make it a case of polymorphism. There has to an intentional design of the code such that we capitalize on the ability. (This part about the significance of intentional design is a bit hard to decipher.) 

(Is it actually true that inheritance and mixins are ways of implementing polymorphism?) How is this availability built in? In Ruby, the answer would be inheritance and mix-in modules.

> The concept of **inheritance** is used in Ruby where a class inherits the behaviors of another class, referred to as the **superclass**. This gives Ruby programmers the power to define basic classes with large reusability and smaller **subclasses** for more fine-grained, detailed behaviors.
>
> Another way to apply polymorphic structure to Ruby programs is to use a `Module`. Modules are similar to classes in that they contain shared behavior.  However, you cannot create an object with a module. A module must be  mixed in with a class using the `include` method invocation. This is called a **mixin**. After mixing in a module, the behaviors declared in that module are available to the class and its objects.

```ruby
class GoodDog
end

# now we create a new Gooddog object using 'new' method invocation and 
# store it in the local variable "sparky"
sparky = GoodDog.new 
```



```ruby
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak('Arf')

bob = HumanBeing.new
bob.speak("Hello!")
```

What `include` does is makes all the methods from `Speak` module, i.e., `speak` available to both  the `GoodDog` and `HumanBeing` class. This availability works in a very specific way that is revealed in the lookup path. Hence, we can call the `speak` method on both `sparky` and `bob` in line 16 and 19 respectively.

__Method Lookup__

Ruby has a distinct method lookup path that it follows each time a method is called. (I suppose not all programs have this method look up path. Is that right?)

```ruby
module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors
```

It seems the `ancestors` method call reveals not only the superclasses (including itself) but also the modules available to the object. For some reason, both modules and superclasses are part of the inheritance hierarchy. 

Since both inheritance from class and mixing modules can be implemented at once, there is a possibility of confusion regarding whether the class or module comes before in the look up path. For instance, say class `ABC` inherits from another class `XYZ` and also mixes in the module `MNO`, then it is unclear if `XYZ` comes before `MNO`  in the method lok up. There must be a way of resolving this.

It seems a consequence of this method look up path is that the method defined in the closest ancestors overrides the method defined in the distant ancestor class. (A similar thing is happening in the case of variable shadowing.)

```ruby
# Exercises

class SampleCourse
end

phil_101 = SampleCourse.new

module RevealInfo
  def summary
    puts self
  end
end

class SampleCourse
  include RevealInfo
end

class SamplePeople
  include RevealInfo
end

phil_101 = SampleCourse.new
prof_dunk = SamplePeople.new

=begin
Once we have the 'summary' method available through the use of module, we can invoke the 'summary' method on both 'phil_101' and 'prof_dunk'. They will respectively reveal what we have defined as the 'to_s' method for that particular class. in the case of a course, it may be the course description; in the case of a person, it may be some details of who they are and what they do. The core idea is that the same method is available to different objects, i.e., objects instantiated from different classes. This is polymorphism.
=end
```

