### Classes and Objects

Classes are outlines for what the objects are made up of (states) and what they are able to do (behaviors).

Objects are instantiations of classes. They have states and behaviors.

Objects are created from classes when we invoke the `new` class method. Since the `new` class method triggers and passes in all the arguments given to it to the `initialize` method , we have to pass in adequate number of arguments to the `new` method invocation.

Example:

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

# Here the Person object (dostoyevsky) is the collaborator object for the Book object ("the_idiot")

```