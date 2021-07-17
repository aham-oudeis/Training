### Problem

input: an odd integer

output: 4-pointed diamonds for n
		* the first line is a blank
		* the second line contains 1 diamond at the center
		* Third line contains 3 diamonds at the center
		* fourth line contains 5 diamonds at the center.
		* ...
		* there are total of n + 1 lines

### Problem components

1. what is the relation between the line number and the number of stars?
2. is the first line just an extra puts or part of the looping construct?
3. better to think of it as having n lines of puts statements

Algorithm

1. the half length = (n + 1) / 2
2. from 1 to the half-length, print 2n - 1 stars
3. from half-length + 1 to full length, repeat 2 backwards

```ruby
def diamonds(num)
  half = (num + 1) / 2
 
  puts 
  1.upto(num) do |i|
    i = num + 1 - i if i > half # for printing in reverse
    pattern = 
    	i == 1 ? '*' : '*' + " " * (2 * i - 3) + '*'
    puts pattern.center(num)   
	end
  puts
end
```

