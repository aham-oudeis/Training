# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"
# karl = Bulldog.new
# puts karl.speak           # => "bark!"
# puts karl.swim

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'Meow!'
  end

  def swim
    "can't swim!"
  end

  def fetch
    'no fetching!'
  end
end

eve = Dog.new
p eve.fetch
p eve.swim

kitty = Cat.new
p kitty.speak
p kitty.fetch