=begin
Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds. 
=begin
## Understanding the Problem

requirements: 
-the input is a floating point number
-the output has be a string
-the string has been divided into degrees, minutes, and seconds
-the transformation is according to the following rules:
  --1 degree corresponds to 1 degree
  --1 degree corresponds to 60 minutes
  --1 minute corresponds to 60 seconds
-the floating point has to be separated into decimal and non-decimal
-the decimal value has to be multiplied by 60 ==> gives us minutes
-what remains as a decimal value after the multiplication ==> gives us seconds
## Examples

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

## Data Structures
-use arrays to store the three sets of values
-first element corresponds with degrees, 
-second element corresponds with minutes, and
-third element corresponds with seconds.

## Algorithm
1. Take the floating point number and turn it into a string
2. Split the string by the point
3. Take the second element of the array, convert it into an integer
4. multiply that integer by 0.6 to convert it into minutes
5. take the result and turn it into string and split the string by the point
6. assign the first element as the minutes
7. convert the remaining string into an integer 
8. multiply the remaining string by 0.6
=end

DEGREE = "\xC2\xB0"

puts ("34" + DEGREE)

def dms_array(num)
  degrees, minutes = num.divmod(1)

  minutes, seconds = (minutes * 60).round(3).divmod(1)

  seconds, extra = (seconds * 60).round(3).divmod(1)
  
  [degrees.to_s, sprintf("%02d", minutes), sprintf("%02d", seconds)]
end

def dms(num)
  arr = dms_array(num)

  arr[0] << DEGREE
  arr[1] << "'"
  arr[2] << "\""

  arr.join
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
