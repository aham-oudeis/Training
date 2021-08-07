### Instance methods vs. class methods

Instance methods are methods we can invoke on the objects and class methods are methods we can invoke on the class.

If we look under the hood, it turns out that class methods are just instance methods defined for that class object, where the class is treated as an object. These 'class methods' are stored in the singleton_class, which stay slightly hidden.

Inside of the class we define class methods by adding `self.` before the method name. What this does is create a singleton class for the class object and puts the method there. That is why we can simply open the singleton class and put the 'class' methods there just as we put instance methods.

```ruby
# Here is an example of how we define the class method and how we call it

class Something
  def self.name
    "This is something."
  end
end

p Something.name
```

###