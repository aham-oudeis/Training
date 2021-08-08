# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# oracle = Oracle.new
# oracle.predict_the_future

# p oracle.class.ancestors

=begin
Line 12 will return (with no output) a string "You will {sample_string}", where sample_string can be any one item from the array returned by `choices.`

Line 14 will output and return the array [Oracle, Object, Kernel, BasicObject], because
1. `oracle` refers to an Oracle object instantiated on line 11
2. calling 'class' on `oracle` returns the class `Oracle`
3. and calling `ancestors` on `Oracle` class returns an array of method lookup path.
=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

=begin
Line 42 will return a string of the form "You will {sample_phrase}", where sample_phrase will be one of the phrases from the array returned by the `choices` method defined in line 36-38.

This is because
1. `trip` references the RoadTrip object
2. calling `predict_the_future` on `trip` calls the method defined in the superclass Oracle, since RoadTrip does not have the `predict_the_future` instance method.
3. calling the `choices` method from inside the method `predict_the_future` invokes the `choices` method defined in the RoadTrip class, because RoadTrip class is the first item in the method lookup chain.
=end

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

p HotSauce.ancestors

# What is the method look up chain for `Orange` and `HotSauce`?

=begin
The method look up chain for `Orange` is:
  [Orange, Taste, Object, Kernel, BasicObject]

And the method look up chain  for 'HotSauce' is:
  [HotSauce, Taste, Object, Kernel, BasicObject]
=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works.
# What code would you need to write to test your theory?

=begin
the `@@cats_count` variable counts the number of Cat objects created by invoking the `new` method on Cat class.

It does so by incrementing the value of `@@cats_count` everytime the `initialize` method is invoked. Since the class variables can be reassigned anywhere from anywhere  inside the instance method or the class method, `@@cats_count` is reassigned to a new number after incrementing  by 1 everytime a new Cat object is instantiated.

You can verify this outputting the value of `@@cats_count` after instantiating different Cat objects.
=end