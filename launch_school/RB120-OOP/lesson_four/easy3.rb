class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi
# puts "Hello" on the console

hello = Hello.new
begin
  hello.bye
rescue StandardError => exception
  puts exception.message
end

# no method error

hello = Hello.new

begin
  hello.greet
rescue StandardError => exception
  puts exception.message
end
# wrong number of arguments error

hello = Hello.new
hello.greet("Goodbye")
# outputs "Goodbye" to the console

begin
  Hello.hi
rescue StandardError => exception
  puts exception.message # undefined method hi for Hello class
end

# Question 2
# we add self. before hi in line 8
# in other words, we maake the hi method into a class method by prefixing self to its name
# and then create a new Greeting object and then call the greet method on that greeting
# object with "hello" passed in as an argument

# Question 6

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# answer is: we can write @age instead of self.age
# I thought the self here refers to the calling object and calls the setter method
# but the Launch School explanation is as follows:
=begin
self in this case is referencing the setter method provided by attr_accessor - this means that we could replace self with @.
=end
