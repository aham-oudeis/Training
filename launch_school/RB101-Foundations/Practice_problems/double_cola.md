```ruby
=begin
Sheldon, Leonard, Penny, Rajesh and Howard are in the queue for a "Double Cola" drink vending machine; there are no other people in the queue. The first one in the queue (Sheldon) buys a can, drinks it and doubles! The resulting two Sheldons go to the end of the queue. Then the next in the queue (Leonard) buys a can, drinks it and gets to the end of the queue as two Leonards, and so on.

For example, Penny drinks the third can of cola and the queue will look like this: Rajesh, Howard, Sheldon, Sheldon, Leonard, Leonard, Penny, Penny

Write a program that will return the name of the person who will drink the n-th cola.

Input:
The input data consist of an array which contains at least 1 name, and single integer n which may go as high as the biggest number your language of choice supports (if there's such limit, of course).

Output / Examples:
Return the single line — the name of the person who drinks the n-th can of cola. The cans are numbered starting from 1.


Problem
Input: arr and an integer
output: the first element of the array after that many iteration
  Rules:
  1. once the element is shifted from the array, two more is appended

Components:
1. the queue starts with a length
2. once queue is finished, the queue is doubled

Example:
[Sheldon, Leonard, Penny, Rajesh, Howard] ==> 

[Sheldon, Sheldon, Leonard, Leonard, Penny, Penny, Rajesh, Rajesh, Howard, Howard]

Algorithm:
1. Initialize an arry to the copy of given array
2. and loop untill the number reaches the given value.
3. inside the loop change the copied array as follows:
  1. shift the array and take the element and multiply by to and append it to the array.
  2. untill the counter is greater than the given number
=end

def who_is_next(names, number)
  names = names.dup
  
  counter = 1
  
  loop do
    break if counter == number
    element = names.shift
    
    names << element
    names << element
    counter += 1
  end
  
  names[0]
end

names = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]

p who_is_next(names, 1) == "Sheldon"
p who_is_next(names, 2) == "Leonard"
p who_is_next(names, 3) == "Penny"
p who_is_next(names, 6) == "Sheldon"
p who_is_next(names, 10) == "Penny"
p who_is_next(names, 52) == "Penny"
p who_is_next(names, 1802) == "Penny"
# p who_is_next(names, 7230702951) == "Leonard"

=begin
* initialize position = 0
* initialize cycle = 0
* obtain the array size (size)
* loop until position > given number
* increment the cycle by 1
* obtain the last cycle by substracting one from it
* obtain the last position by substracting (size * 2 ** cycle) from position
* substract the position from the given number
* start a loop and a counter
* substract 2**cycle from the remainder until the position is less than 2 ** cycle
* return the array[counter]
=end

def who_is_next(names, int)
  position = 0
  cycle = 0
  while position < int
    position += 5 * (2 ** cycle)
    cycle += 1
  end
  cycle -= 1
  position -= 5 * (2**cycle)
  
  position = int - position
  
  counter = 0
  while position > 2**cycle
    counter += 1
    position -= 2**cycle
  end
  
  names[counter]
end

def who_is_next(names, int)
  position, cycle = 0, 0
  size = names.size

  while position < int
    position += size * (2 ** cycle)
    cycle += 1
  end
 	
  cycle -= 1
  current_number_of_repetitions = 2 ** cycle

  position -= int # how far back from the last index do I have to go
  index = (position / current_number_of_repetitions) + 1
  names[-index]
end

=begin
[Sheldon, Leonard, Penny, Rajesh, Howard] 5^0 + 0 = 1
[Leonard, Penny, Rajesh, Howard, Sheldon, Sheldon] 
[Penny, Rajesh, Howard, Sheldon, Sheldon, Leonard, Leonard]
[Rajesh, Howard, Sheldon, Sheldon, Leonard, Leonard, Penny, Penny]
[Howard, Sheldon, Sheldon, Leonard, Leonard, Penny, Penny, Rajesh, Rajesh]
[Sheldon, Sheldon, Leonard, Leonard, Penny, Penny, Rajesh, Rajesh, Howard, Howard] 6, 7


[Sheldon 1, Leonard 2, Penny 3, Rajesh 4, Howard 5]

1 2 3 4 5  = 5 movements because 5 * 2^0 = 5
11 22 33 44 55 = 5 + 10 = 15 movements because 5 + 5*2^1 = 15
1111 2222 3333 4444 5555 = 15 + 20 = 35 movements because 15 + 5 * 2 ^2 = 35
11111111 2222222222 3333333333 4444444444 5555555555 = 75 movements because 35 + 5 * (2**3) 


=end
```

