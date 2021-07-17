=begin
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

### Problem
-input integer represents either the minutes before midnight or minutes after midnight
-if the input integer is negative, substract the minutes
-if the innput integer is positive, add the minutes
-the output has to be formatted properly in terms of two digits for hours and minutes

## Essential Components of the Problem
-identifying whether the integer is positive of negative
-conversion of minutes into hours and minutes
-the conversion requires dividing the input by 60 and 
-taking the quotient as the hour, remainder is the minutes
-but things are slightly different when it comes to negative number
-it's simple to add the negative number and 1440 to get the positive value
-then the same process gives the result
=end

def time_of_day(int)
  # since 24 hours contains 24 * 60 = 1440 minutes
  sign_factor = if int < 1 then -1 else 1 end
  days_adjusted_minutes = (int.abs % 1440) * sign_factor
  normalized_minutes = int < 0 ? (1440 + days_adjusted_minutes) : days_adjusted_minutes
  hour, minutes = normalized_minutes.divmod(60)
  format("%02d:%02d", hour, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"