class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  # no need for the following initialize method; the default initialize method
  # does that anyway
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# the problem was with calling the super method without any arguments.
# When super is called without any arguments or empty brackets,
# super calls the method of the same name higher up in the inheritance
# hierarchy with all the arguments passed to the initialize (the enclosing)
# method. But this gives us an error because the initialize method
# in the parent class only takes two arguments, not three.

# the FlightlessBird initialize method is not necessary because it
# gets called by default.
