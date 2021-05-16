=begin
how many months have five fridays in a given year?
**Problem**
-input: year
-output: number of months that have five fridays

Essential:
-how to determine how many fridays does a month have?
-a brute force is by looping through each day and test if it is a friday
-or, we can try using the first day, length of the month, and figuring how out
-how many fridays it contains
-how to determine what is the first day of the month?
-how to determine the length of the month?
-how to determine the number of fridays based on the two data?
  --assign a number between 1 to 7 to the days
  --take the divmod of the number of days by 7
  --div gives the number of weeks and mod gives the day number
  --if the day number is smaller than the assigned day number
  --here a difficulty lies in finding the offset for the day number
  --say, day starts at number 4 (wednesday)
  --adding the mod value to the start number should give us the day number
  --like, 12 hours after 4 is just 12; 11 hours after 4 is 15 mod 12 = 3

Algorithm
-for each month find the first day of the month
-assign (sunday to saturday) a value from 0 to 6
-here, friday is 5; monday is 1; sunday 0
-for each month find the number of days in the month
-get divmmod of number of days by 7
-div gives the number of weeks
-to get the final day name, add the start of the month day value to the mod value
-and get a 7 mod of the final result
-that gives us the final day number
-if the day-number of interest is less than the final day number, then add 1 to the number of weeks
- start day = 5, total_days = 30, 30.divmod(7) = 4, 2, then 1 + 5 = 6 (Saturday)
- since 7 > 5, we have to add 1 to 4
-start day = 1, total_days = 31, 31.divmod(7) = 4, 3, then 2 + 1 = 3 (Wednesdat)
-start day = 2, total_days = 31, 31.divmod(7) = 4, 3, then 2 + 2 = 4  (Thursday)
-start day = 4, total_days = 30, 30.diivmod(7) = 4, 2, then 1 + 4 = 5 (Friday)
-start day = 6, total_days = 31, 31.divmod(7) = 4, 3, then 2 + 6 = 8 % 7 = 1 (Monday)
-start day = 7, total_days = 31, 31.divmod(7) = 4, 3, then 2 + 7 = 9 & 7 = 2 (Tuesday)
-start day = 5, total_days = 31, 31.divmod(7) = 4, 3, then 1 + 5 = 6 >= 5, 1
=end

require 'date'

# def five_fridays?(number_of_days, start_day)
#   count_day = 5 # Friday
#   #start_day = start_day % 7

#   weeks, remaining_days = number_of_days.divmod(7)

#   rollover_days = 0.upto(remaining_days - 1).map {|i| (start_day + i) % 7}

#   rollover_day = (rollover_days.include?(count_day) ? 1 : 0)

#   number_of_fridays = weeks + rollover_day

#   p number_of_fridays

#   number_of_days == 5
# end


# def five_fridays(year)
#   count_five_fridays = 0

#   1.upto(12) do |month|
#     start_day = Date.new(year, month, 1).cwday
#     last_day = Date.new(year, month, -1).cwday
#     number_of_days = ((Date.new(year, month, -1) -
#                        Date.new(year, month, 1)) + 1).to_i

#     bool = five_fridays?(number_of_days, start_day)

#     count_five_fridays += 1 if bool
#
#   end

#   count_five_fridays
# end

def five_fridays(year)
  count_five_fridays = 0

  1.upto(12) do |month|
    num_of_fridays = Date.new(year, month).step(
                      Date.new(year, month, -1)).select(&:friday?).size

    count_five_fridays += 1 if num_of_fridays == 5
  end

  count_five_fridays
end

p five_fridays(2021)
