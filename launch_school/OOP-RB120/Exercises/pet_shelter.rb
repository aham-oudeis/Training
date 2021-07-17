class Being
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Owner < Being
  attr_accessor :pets

  def initialize(name)
    super
    @pets = []
  end

  def number_of_pets
    pets.size
  end
end

class Pet < Being
  attr_reader :animal
  def initialize(animal, name)
    super(name)
    @animal = animal
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Shelter
  attr_reader :data

  def initialize
    @data = {}
  end

  def adopt(owner, pet)
    owner.pets << pet
    @data[owner] = owner.pets
  end

  def print_adoptions
    @data.each do |owner, animals|
      puts "#{owner.name} adoped the following pets:"
      puts owner.pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."