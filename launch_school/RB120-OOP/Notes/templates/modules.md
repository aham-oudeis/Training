Modules are containers for behaviors and constants usable in other classes via mixin.

Since classes can inherit methods from modules but are different from class inheritance, they are called interface inheritance.

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

