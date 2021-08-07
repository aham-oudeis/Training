### Classes and objects

Classes are outlines for what the objects are made up of (states) and what they are able to do (behaviors). 

Objects are instantiations of classes. They have states and behaviors. 

Objects are created from classes when we invoke the `new` class method. Since the `new` class method triggers and passes in all the arguments given to it to the instance method `initialize`, we have to pass in adequate number of arguments to the `new` method invocation.

```ruby
class Person
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
end

class Book
  def initialize(name, author)
    @name = name
    @author = author
  end
end

dostoyevsky = Person.new("Fyodor", "Dostoyevsky")
the_idiot = Book.new('The Idiot', dostoyevsky) 

# Here the Person object (dostoyevsky) is the collaborator object for the Book object
("the_idiot")

```

### Use `attr_*` to create setter and getter methods

```ruby
class Course
  attr_acessor :name, :teacher
 
  def initialize(name, teacher)
    @name = name
    @teacher = teacher
    @students = []
  end
  
  def enroll(student)
    if students.size < 30
    	students << student
    else
      puts "Class full!"
    end
  end
  
  private
  
  attr_reader :students
end

=begin
attr_* methods are prefered for their simplicity, but when there are other demands
in place, we would have to use manual getter and setter methods. For instance, when we need to have a built-in customization for accessing and setting instance variables.
=end
```

### How to call setters and getters

we call setters and getters on the objects just like any other method calls, writing the getter and setter method name after the dot operator. 

Ruby offfers a nice syntax for the setter methods. While we define the setter methods as follows:

```ruby
def name=(name)
  @name = name
end
```

We can invoke the setter method in a much cleaner way:

```ruby
object.name = 'new name'
```

This is Ruby's syntactical sugar.

### Instance methods vs. class methods

Instance methods are methods we can invoke on the objects and class methods are methods we can invoke on the class. 

If we look under the hood, it turns out that class methods are just instance methods defined for that class object, where the class is treated as an object. These 'class methods' are stored in the singleton_class, which stay slightly hidden.

Inside of the class we define class methods by adding `self.` before the method name. What this does is create a singleton class for the class object and puts the method there. That is why we can simply open the singleton class and put the 'class' methods there just as we put instance methods. 

```ruby
# in all three following cases, Something.name should return "This is something."

class Something
  def self.name
    "This is something."
  end
end

# This is equivalent to:

class Something; end

def Something.name
  "This is something."
end

# In a weird way, this is equialent to:

class Something; end

Ghost = Something.singleton_class

class Ghost
  def name
    "This is something."
  end
end

# here, we open up the Ghost class and add instance method there
# since Something is an instance of the Ghost class, we can then
# invoke the name method defined in the Ghost class on Something.

# The following is just another way of opening the singleton class 
# and putting the class methods there.

class Something
  class << self
    def name
      "This is something."
    end
  end
end
```



Hence, when we define a method with `self` Ruby creates a singleton class and puts that method there. 

The weird thing is that when we inherit from a superclass, the subclass inherits the class methods as well. The inheritance of the instance methods and class methods are more or less similar, except for the fact that instance methods remain as instance methods and class methods remain as class methods. That is, instance method can only be called by objects and class methods can be called by the classes.

###  Method Access Control

Method access control are ways of implementing encapsulation through the usage of _access modifiers_. Method access control enables hiding certain methods and making other methods part of the public interface. Ruby has three _access modifiers_: `public`, `private`, `protected`. 

> A private method is internal to the implementation of a class, and it can only be called by other instance methods of the class (or, as we’ll see later, its subclasses). Private methods are implicitly invoked on self, and may not be explicitly invoked on an object. 
>
> Protected methods are very similar to private methods. The main  difference between them is protected methods allow access between class  instances, while private methods don't. If a method is protected, it  can't be invoked from outside the class. This allows for controlled  access, but wider access between class instances.
>
> A protected method is like a private method in that it can only be invoked from within the implementation of a class or its subclasses. It differs from a private method in that it may be explicitly invoked on any instance of the class, and it is not restricted to implicit invocation on self. A protected method can be used, for example, to define an accessor that allows instances of a class to share internal state with each other, but does not allow users of the class to access that state. (p. 232)

But...

> It is important to understand, however, that Ruby’s metaprogramming capabilities make it trivial to invoke private and protected methods and even to access encapsulated instance variables. To invoke the private utility method defined in the previous code, you can use the send method, or you can use instance_eval to evaluate a block in the context of the object: 
>
> ```ruby
> w = Widget.new # Create a Widget
> w.send :utility_method # Invoke private method! 
> w.instance_eval { utility_method } # Another way to invoke it 
> w.instance_eval { @x } # Read instance variable of w
> ```
>

Example:

```ruby
class BankAccount
  def initialize(name, balance)
    @name = name
    @balance = balance
  end
  
  def >(other)
    balance > other.balance
  end
  
  private
  
  attr_reader :balance
end

bill = Account.new("Billy", 2957)
marvin = Account.new("Marvin", 38271)

p bill > marvin 

# line 19 throws an error because we cannot call the private methods with an explicit
# caller the way we do in line 8
# but if we change line 11 from private to protected, the code works.

class BankAccount
  def initialize(name, balance)
    @name = name
    @balance = balance
  end
  
  def >(other)
    balance > other.balance
  end
  
  protected
  
  attr_reader :balance
end

bill = Account.new("Billy", 2957)
marvin = Account.new("Marvin", 38271)

p bill > marvin #=> false

# This code works because protected methods can be called from within the class on a different object of the same class or its subclass.
```



### Referencing and setting instance variables vs. using getters and setters

We have two different ways of accessing and changing the value stored in the instance variables. To access the value, we can directly reference the instance variable or we can invoke the getter method. To change the value, we can directly change the value stored in the instance variable or we can invoke the setter method. Despite there being these two ways, it is preferable to rely on getter and setter methods for at least two reasons:

1. by using the getter method, we can have built in customization of the the value either for the sake of presentation (like adding a prefix) or for the sake of data protection (hiding some parts, like bank account).
2. by using the setter method, we can customize the value that is stored in the instance variable. 
   - For instance, although we allow the setter method to take a string as an argument, we may want to actually store a different object (say, Book object) with that value, instead of storing a string object. 

###  Class inheritance, [encapsulation](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming), and [polymorphism](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming)

```ruby
class Course
  attr_reader :name, :book, :syllabus

  def initialize(name, book, syllabus=nil)
    @name = name
    @book = book
    @syllabus = syllabus
    @students = []
  end

  def enroll(student)
    students << student
  end
  
  def assign_responsibilities(participants)
    participants.each do |participant|
      participant.prepare_for(self)
    end
  end
  
  private
  
  attr_reader :students
end

class Person
  attr_reader :first_name, :last_name, :pronoun

  def initialize(first_name, last_name, pronoun)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @pronoun = pronoun
  end

  def name
    "#{last_name}, #{first_name}"
  end
end

class Student < Person
  def prepare_for(course)
    buy(course.book)
    read(course.syllabus)
  end
end

class TeachingAssistant < Student
  def prepare_for(course)
    # read(course.syllabus)
    # compile_questions(course.syllabus)
  end
end

class Faculty < Person
  attr_reader :rank

  def initialize(first_name, last_name, pronoun, rank)
    super(first_name, last_name, pronoun)
    @rank = rank
  end
  
  def prepare_for(course)
    # email(course.students)
    # create_lesson_plan(course.book)
  end
end

molly = Student.new("Molly", "Holmes", "She/her")

cottonfield = TeachingAssistant.new("Blake", "Cottonfield", "She/her")

mira = Faculty.new("Mira", "Rudal", "She/her", :tenured)

ancient_ethics = Course.new("Ancient Ethics", "Ancient Ethics by Julia Annas")
ancient_ethics.enroll(molly)

ancient_ethics.assign_responsibilities([molly, cottonfield, mira])
```



Encapsulation refers to the practice of hiding certain pieces of functionality from rest of the codebase. This can be implemented in different ways. Ruby implements encapsulation by using objects. Method access control is also one of the ways of implementing encapsulation at the object level.

Polymorphism refers to the ability of different types of objects to respond to the same method call. The basic idea is that if different objects refer to the same method call, it does not matter how the types of the objects differ. What matters is that they respond to the same method. This feature enables programmer to write DRY code. 

Polymorphism enables programmers to work in a rather flexible way with the objects.

### [Modules](https://launchschool.com/lessons/dfff5f6b/assignments/2cf31cc8)

Modules are containers for shared behaviors and constants. 

Or, Modules are collections of  behaviors usable in other classes via mixin. 

They can be used for namespacing and extracting common behaviors. 

They are mixed in with classes using the following syntax: `include ModuleName`'', where `ModuleName` stands for the name of the module that is to be included.

```ruby
module Flyable
  def can_fly
    "I am a #{self.class}. I can fly."
  end
end

class Plant
end

class Animal
end

class Mammal < Animal
end

class Bird < Animal
  include Flyable
end

class Bat < Mammal
  include Flyable
end

class Penguin < Bird
end

# Here, a Bat object can invoke the fly method that returns the string object:
# "I am a Bat. I can fly."
```



###  Method lookup path

Method loopup path is the sequential path that Ruby traverses in looking for a method. This path can be found out by calling the `ancestors` method on the class. Ruby invokes the first method it finds in this path; if it does not find any method of that name, it throws a `NoMethod` error. 

###  self

-   [Calling methods with self](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#callingmethodswithself)

We use `self` to call the setter methods from inside the class, because in absence of the `self` Ruby does not know whether we meant to call the setter method or just initialize a local variable. 

> We're required to use `self` so that Ruby knows the difference between initializing a local variable and invoking a setter method.

-   [More about self](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part2#moreaboutself)

We also use `self` to define the class methods (or, rather the methods in the singleton_class.)

`self` is a way of being explicit about the calling object.

`self` references where Ruby is in the program execution or what the calling object is.

###  Reading OO code

### Fake operators and equality

Except for `.` `::`, `ternary operator`, and the logical operators, most of what seem like operators are in fact methods defined for that particular object. 

For instance, when we write `'abc' == 'abcd'` in ruby, we are not using an operator but a method call defined in the String class.

What this does is compare if the two objects have the same value. 

However, when we invoke the same equivalence method for our custom objects without defining == for the custom class, the method Ruby finds is from BasicObject, which compares the two objects by checking if they are the same object, not if the two objects have the same value.

### Truthiness

In Ruby anything except `false` or `nil` evaluates as `true`. That means, a custom object with no attributes would be considered `truthy`. 

```ruby
class Something; end
empty_object = Something.new

empty_objet ? "Empty Object is Truthy" : "Empty Object is Falsey."

#=> "Empty Object is Truthy."

# one new thing from OOP is that uninitialized instance variables returns nil;
# so, if we happen to evaluate an uninitialized instance variable, then
# it would evaluate as false.

class Something
  attr_reader :name
end

empty_object = Something.new

empty_objet.name ? "Empty Object is Truthy" : "Empty Object is Falsey."

#=> "Empty Object is Falsey."

# This is because, the calling the name method on the empty_object returns
# a reference to the instance variable @name, which is not yet initialized
# hence, it returns nil and thus empty_object.name evaluates to false.
```

###  Working with collaborator objects

Collaborator objects are objects that are part of the state of another object.

```ruby
class Course
  def initialize(name, teacher, students)
    @name = name
    @teacher = teacher.capitalize
    @students = students
  end
end

=begin
In this example, we define the Course class such that a string object stored in the instance variable @teacher is part of the Course object's attribute. In this sense, the string object is a collaborator object of Course object. 

Say, we store an array object in the instance variable @students. In that case, the array object would be the collaborator object of the course object.
=end
```

### Miscellaneous Stuff

> When you invoke `#super` within a method, Ruby looks in the inheritance hierarchy for a method with the same name. 

I feel like this LS definition is a bit inadequate, because the inheritance hierarchy includes the class itself. If the super were to start calling method from the class itself, it would run into problems. It seems better to be explict that `super` invokes the enclosing method in the superclass.

> `super` works like a special method invocation: it invokes a method with the same name as the current one, in the superclass of the current class.

### Constant Look up Path

Constants have lexical scope. What that means is that whenever Ruby encounters a call for a Constant, it starts looking 

Let's put a Constant in the class, in the superclass, in the module and test which one has precedence:

```ruby
CONS = "This is from the outer scope."

class SuperTest
  CONS = "This is a constant in inheritance hierarchy."
end

module A
  module Ba
    CONS = "This is a module Constant."

    module Cc
      class Test < SuperTest
        CONS = "This is a class constant."
        def check
          puts CONS
        end
      end
    end
  end
end

A::Ba::Cc::Test.new.check
# => "This is a class constant."
# This shows that the constant in the class has the highest precedence. Or, that for 
# the constant look up path, the class comes first. 

# when we comment out the class constant as follows and run the code:

CONS = "This is from the outer scope."

class SuperTest
  CONS = "This is a constant in inheritance hierarchy."
end

module A
  module Ba
    CONS = "This is a module Constant."

    module Cc
      class Test < SuperTest
        # CONS = "This is a class constant."
        def check
          puts CONS
        end
      end
    end
  end
end

A::Ba::Cc::Test.new.check
# => "This is a module Constant"

# This should be a bit surprising, given that  we would expect the Constant in the superclass to have precedence. This is what it means to have lexical scope. When it comes to finding  a constant, Ruby looks wherever the call for the constant comes up and then goes outward in the nested modules. 

# Now we know that in terms of looking for a constant, Ruby looks in the nested structure first.

# what if the constant is defined outside of the module? We have two choices: either the constant is defined in the superclass or it is defined in the 'main' object.

# Let's comment out the constants defined in the modules and leave only the ones defined in the 'main' scope and then in the superclass.

CONS = "This is from the outer scope."

class SuperTest
  CONS = "This is a constant in inheritance hierarchy."
end

module A
  module Ba
    # CONS = "This is a module Constant."

    module Cc
      class Test < SuperTest
        # CONS = "This is a class constant."
        def check
          puts CONS
        end
      end
    end
  end
end

A::Ba::Cc::Test.new.check

# => "This is a constant in inheritance hierarchy."

# This should be a bit more surprising. 
# Instead of looking for the Constant in the 'main' object, Ruby actually looks for the constant in the superclass. 

# This is because the constant defined in the 'main' object is actually defined for an object in the Object class. (This part I am not sure, but something like this is true, because when we run `self.class` we get Object.) And Object is the superclass of SuperTest. That means, Object comes after SuperTest in the inheritance heirarchy.

```



Overall, the constant look up path is weird because, unlike the method look up path, it does not depend on the calling object. Rather it depends on where Ruby first finds the Constant reference expression. 

> When a constant is referenced without any qualifying namespace, the Ruby interpreter must find the appropriate definition of the  constant. To do so, it uses a name resolution algorithm, just as it does      to find method definitions. However, constants are resolved much  differently than methods.
>
> Ruby first attempts to resolve a constant reference in the lexical scope of the reference. This means that it first checks the class or  module that encloses the constant reference to see if that class or      module defines the constant. If not, it checks the next enclosing class  or module. This continues until there are no more enclosing classes or  modules. Note that top-level or “global” constants are not considered  part of the lexical scope and are not considered during this part of  constant lookup. The class method `Module.nesting` returns the list of  classes and modules that are searched in this step, in the order they  are searched.
>
> If no constant definition is found in the lexically enclosing scope, Ruby next tries to resolve the constant in the inheritance  hierarchy by checking the ancestors of the class or module that referred      to the constant. The `ancestors` method  of the containing class or module returns the list of classes and modules searched in this step.
>
> If no constant definition is found in the inheritance hierarchy, then top-level constant definitions are checked. (from The Ruby Programming Language)

>The important difference between constants and methods is that constants are looked up in the lexical scope of the place they are used before they are looked up in the inheritance hierarchy