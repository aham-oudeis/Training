### Truthiness

In Ruby anything except `false` or `nil` evaluates as `true`. That means, a custom object with no attributes would be considered `truthy` but a reference to uninitialized instance variable would be `falsey`.

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