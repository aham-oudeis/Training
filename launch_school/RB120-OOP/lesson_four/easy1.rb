# Question 1

# p true.class
# p "hello".class
# p [1, 2, 3, "happy days"].class
# p 142.class

# Question 2

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# p Car.ancestors
# p Truck.ancestors
# p Car.method_defined? :go_fast

# small_car = Car.new
# small_car.go_fast

=begin
When we call the go_fast method on the Car object, it looks for the method in that class. It does not find it and searches in the next item in the method loop up path, which is the Speed module. It finds the method there and calls the method. From inside the method we reference the calling object, i.e. the Car object and invoke the class method on it. It returns its class, i.e. Car, which is then converted to a string through string interpolation. And the output is "I am a Car and going super fast!"
=end

# Question 4

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# mitthu = AngryCat.new

# p mitthu.hiss

# Question 5
# Here, Pizza class has the attributes and any Pizza object would have the
# instance variable; but the Fruit object would not, because instance variables
# have to start with @ and in line three we only intialize a local variable.

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# p Fruit.new("Orange").instance_variables

# p Pizza.new("Margharita").instance_variables

# Question 6

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

p Cube.new("27").volume
