class Clock
  attr_reader :hour, :minutes

  def initialize(hour, minutes = 0)
    @hour = hour
    @minutes = minutes
  end

  def +(integer)
    self.minutes = @minutes + integer
    self
  end

  def -(integer)
    self.minutes = @minutes - integer
    self
  end

  def to_s
    format('%02d:%02d', @hour, @minutes)
  end

  def ==(other)
    @hour == other.hour && @minutes == other.minutes
  end

  private

  def minutes=(mins)
    hr, @minutes = mins.divmod(60)
    self.hour = @hour + hr
  end

  def hour=(hr)
    @hour = hr % 24
  end

  class << self
    def at(hour, minutes = 0)
      new(hour, minutes)
    end
  end
end

clock1 = Clock.at(15, 37)
clock2 = Clock.at(15, 36)
clock3 = Clock.at(14, 37)

p clock1
p clock2
p clock3