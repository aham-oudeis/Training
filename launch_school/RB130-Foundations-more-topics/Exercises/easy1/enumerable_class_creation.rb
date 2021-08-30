class Tree
  include Enumerable
end

p Tree.new.each # This will throw a NoMethodEror regarding each
p Tree.new.map # This won't throw an error, because it is available through the  mixin

# that means, including Enumerable does not make the each method available, but other iterative methods are available through Enumerable

class Tree
  include Enumerable

  def each
  end
end

p Tree.new.map