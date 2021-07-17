Exercises

```ruby
class MyCar
  attr_accessor :color
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end
  
  def self.mileage(gas, miles)
    puts "#{miles / gas} miles per gallon of gas."
  end
  
  def current_speed
    puts "The current speed is #{@speed}"
  end
  
  def speed_up(num)
    @speed += num
  end
  
  def brake(num)
    @speed -= num
  end
  
  def stop
    @speed = 0
  end
  
  def to_s
    "A #{color} colored #{year} car of #{model} model."
  end
end
```



