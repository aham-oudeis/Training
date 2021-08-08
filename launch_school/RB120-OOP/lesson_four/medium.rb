# Question 1
# Ben is right, because attr_reader creates a method name balance that is invoked
# in line 9; this method accesses @balance.

# Question 4

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

class Goodbye
  def bye
    greet("Goodbye")
  end
end

Hello.new.hi

# Queston 5

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type ||= "Plain"
    @glazing = glazing
  end

  def to_s
    #[@filling_type, @glazing].reject(&:nil?).join(' with ')
    glaze_type = (@glazing ? " with #{@glazing}" : "")

    "#{@filling_type}#{glaze_type}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5