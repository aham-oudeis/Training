class CustomSet
  def initialize(elements=[])
    self.elements = elements
  end

  def empty?
    @elements.empty?
  end

  def ==(other)
    elements.sort == other.elements.sort
  end

  def eql?(other)
    self == other
  end

  def size
    elements.size
  end

  def add(item)
    elements << item unless elements.include?(item)
    self
  end

  def contains?(item)
    elements.include?(item)
  end

  def subset?(set)
    elements.all? { |item| set.contains?(item) }
  end

  def disjoint?(set)
    (elements & set.elements).empty?
  end

  def intersection(set)
    new_elements = (elements & set.elements)
    CustomSet.new(new_elements)
  end

  def difference(set)
    new_elements = (elements - set.elements)
    CustomSet.new(new_elements)
  end

  def union(set)
    new_elements = (elements | set.elements)
    CustomSet.new(new_elements)
  end

  protected

  def elements=(items)
    @elements = items.uniq
  end

  attr_reader :elements
end

p  CustomSet.new([1, 2, 3]).instance_of? CustomSet