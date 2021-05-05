=begin
-input is hour and minutes string
-output is minutes between 0..1439
-if it is 2 hours after midnight, then the minutes have to 2 * 60
-that means the time stamp gives an easy clue to the hour and minutes
-but if it is 2 hours before midnight, the time stamp has to be normalized
-for normalization, the time stamp can be substracted from 1440
=end

def after_midnight(str)
  hours, minutes = str.split(":").map(&:to_i)
  ((hours * 60) + minutes) % 1440
end

def before_midnight(str)
  hours, minutes = str.split(":").map(&:to_i)
  (1440 - (hours * 60 + minutes)) % 1440
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0