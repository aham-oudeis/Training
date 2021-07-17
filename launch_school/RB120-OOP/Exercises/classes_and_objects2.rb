# class Cat
#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end
# end

# Cat.generic_greeting

# kitty = Cat.new
# kitty.class.generic_greeting

=begin
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
  # def rename(new_name)
  #   @name = new_name
  # end

  def personal_greeting
    puts "Hello! My name is #{self.name}."
  end

  def rename(new_name)
    self.name = new_name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')

# kitty.name
# kitty.rename('Chloe')
# kitty.name

# kitty.identify

Cat.generic_greeting
kitty.personal_greeting
=end

=begin
class Cat
  @@total = 0

  def initialize
    @@total += 1
  end

  def self.total
    @@total
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

p Cat.total
=end

=begin
class Cat
  COLOR = "purple"
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I am a #{COLOR} cat."
  end
end

kitty = Cat.new('Sophie')
kitty.greet
=end

=begin
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}"
  end
end

kitty = Cat.new('Sophie')
puts kitty
=end

class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

class Person
  attr_writer :secret

  def compare_secret(other_object)
    secret == other_object.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)