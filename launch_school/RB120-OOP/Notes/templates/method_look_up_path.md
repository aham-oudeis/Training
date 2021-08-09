###  Method lookup path

Method look up path is the sequential path that Ruby traverses in looking for a method. This path can be found out by calling the `ancestors` method on the class. Ruby invokes the first method it finds in this path; if it does not find any method of that name, it throws a `NoMethod` error.

This is quite different from how Ruby looks for a constant.

```ruby
class Something
  def what_am_i?
    puts "I am Something"
  end
end

class SomeSpecificThing < Something
  def what_am_i?
    puts "I am some specific thing"
  end
end

table = SomeSpecificThing.new

table.what_am_i?
=begin
if we run the code as it, then it will output "I am some specific thing". however, if we comment out the method what_am_i?  defined in SomeSpecificThing, then Ruby executes the same method defined in Something, because Something comes next to SomeSpecificThing in the method look up path.
=end

class Something
  def what_am_i?
    puts "I am Something"
  end
end

class SomeSpecificThing < Something
  # def what_am_i?
  #   puts "I am some specific thing"
  # end
end

table = SomeSpecificThing.new

table.what_am_i?
```

###