class Vehicle
  @@number_of_vehicles = 0
  attr_accessor :color
  attr_reader :year, :model

  def initialize(color, year, model)
    @color = color
    @year = year
    @model = model
    @@number_of_vehicles += 1
  end

  def self.mileage(gas, miles)
    puts "#{miles / gas} miles per gallon of gas."
  end

  def self.total_vehicles
    @@number_of_vehicles
  end
end

module Drivable
  def road_drivable?(road)
    road.downcase != 'dirt'
  end
end

class MyTruck < Vehicle
  TOTAL_WEIGHT = 2800
end

class MyCar < Vehicle
  TOTAL_WEIGHT = 1600
  # attr_accessor :color
  # attr_reader :year, :model
  include Drivable

  def initialize(color, year, model)
    super
  end

  def to_s
    "My car is a #{color.downcase} colored #{year} #{model}"
  end
end

honda_civic = MyCar.new("Blue", 2019, "Honda Civic")
a_truck = MyTruck.new("Black", 2018, "Ford")

puts Vehicle.total_vehicles
puts MyCar.ancestors
puts MyTruck.ancestors