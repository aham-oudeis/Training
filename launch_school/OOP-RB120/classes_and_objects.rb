=begin
Question 1

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
p bob.name                  # => 'bob'
bob.name = 'Robert'
p bob.name                  # => 'Robert'
=end

=begin
Question 2

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name="", last_name="")
    @first_name = first_name
    @last_name = last_name
  end

  def name
    [@first_name, @last_name].join(" ").strip
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
=end

=begin
Question 3

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    self.name = name
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def name=(name)
    @first_name, @last_name = name.split
    @last_name = '' if @last_name.nil?
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
=end

