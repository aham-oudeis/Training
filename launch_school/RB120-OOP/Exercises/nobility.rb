module Walkable
  attr_reader :name

  def walk
    "#{name} #{gait} forward."
  end
end

class Noble
  include Walkable
  attr_reader :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{title} " + super
  end

  private

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
byron.name
#=> "Byron"
byron.title
#=> "Lord"