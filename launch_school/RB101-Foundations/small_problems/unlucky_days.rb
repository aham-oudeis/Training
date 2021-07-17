=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

**Problem**
-input: year, a number
-output: number of Friday the 13th

Assumptions:
-the year is greater than 1752
-adoption  of Gregorian calender

Essentials:
-loop through months and see if the 13th of that month is a Friday
-if there is a match, increment the value of the count by 1
-'require Date'

Data Structures and Algorithm
-create an array of months [1..12]
-start a count at 0
-loop through the array (say, each method) and test if year-month-13 == Friday
-if the test returns true, increment the count by 1
-returns count
=end

require 'date'

def friday_13th(year)
  count = 0
  (1..12).each do |month|
    count += 1 if Date.civil(year, month, 13).friday?
  end

  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2