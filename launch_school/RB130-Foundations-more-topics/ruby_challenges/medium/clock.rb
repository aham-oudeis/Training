# I made all the operations destructive in the following solution
# class Clock
#   attr_reader :hour, :minutes

#   def initialize(hour, minutes = 0)
#     @hour = hour
#     @minutes = minutes
#   end

#   def +(integer)
#     self.minutes = @minutes + integer
#     self
#   end

#   def -(integer)
#     self.minutes = @minutes - integer
#     self
#   end

#   def to_s
#     format('%02d:%02d', @hour, @minutes)
#   end

#   def ==(other)
#     @hour == other.hour && @minutes == other.minutes
#   end

#   private

#   def minutes=(mins)
#     hr, @minutes = mins.divmod(60)
#     self.hour = @hour + hr
#   end

#   def hour=(hr)
#     @hour = hr % 24
#   end

#   class << self
#     def at(hour, minutes = 0)
#       new(hour, minutes)
#     end
#   end
# end

# Making the operations non-destructive

class Clock
  attr_reader :hour, :minute

  def initialize(hour, minute = 0)
    @hour = hour
    @minute = minute
  end

  def +(integer)
    new_mins = minute + integer
    calculate_new_time(new_mins)
  end

  def -(integer)
    new_mins = minute - integer
    calculate_new_time(new_mins)
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def ==(other)
    @hour == other.hour && @minute == other.minute
  end

  private

  def calculate_new_time(new_mins)
    hr, new_min = new_mins.divmod(60)
    new_hr = (hour + hr) % 24
    Clock.new(new_hr, new_min)
  end

  class << self
    def at(hour, minutes = 0)
      new(hour, minutes)
    end
  end
end

p (Clock.at(10) + 3).to_s
p Clock.at(0) - 50
p Clock.at(23, 30) + 60
p Clock.at(10) + 3061
p Clock.at(10, 30) - 5