=begin
**Problem**
-input is an odd integer
-outut has to be structured as a diamond
  -the first line has to print 1 star at the center
  -the second line has to print 3 starts at the center
  -the third line has to print 5 stars
  -the fourth line has to print 7 stars
  -the fifth line has to print 9 stars
  -the sixth line has to print 7 stars...
-it seems in terms of counting, we start with zero and use 2n + 1
-in terms of decreasing, we have to count with 2(num - idx) + 1
- 2 * 3 + 1
- 2 * 2 + 1
- 2 * 1 + 1

Does it work for three? 1 star, 3 stars, 
=end

def diamond(num)
  (1..num).each do |idx|
    # 2n - 1 till the half, then 2(num - n) + 1 after the half
    times = (idx <= (num / 2) ? ((2 * idx) - 1) : (2 * (num - idx) + 1))
    
    # for a filled diamond, replace " " with "*"  
    pattern = (" " * times)
    pattern[0], pattern[-1] = "*", "*"
    puts pattern.center(num)
  end
end

diamond(11)

