### Problem

You have a bank of switches before you, numbered from 1 to `n`. Each switch is connected to exactly one light that is initially off.  You walk down the row of switches and toggle every one of them. You go  back to the beginning, and on this second pass, you toggle switches 2,  4, 6, and so on. On the third pass, you go back again to the beginning  and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through `n` repetitions.

Write a method that takes one argument, the total number of switches,  and returns an Array that identifies which lights are on after `n` repetitions.

Input: integer

Output: An array with elements with lightbulbs that are 'on'

Example with n = 5 lights:

-   round 1: every light is turned on
-   round 2: lights 2 and 4 are now off; 1, 3, 5 are on
-   round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
-   round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
-   round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

### Problem Components

1. Create an array/hash with lightbulbs number and their state (on or off)
2. Create a function that switches the state of the lightbulbs that are multiples of the given number
3. Loop n times and for each time pass the hash through the functtion on each iteration
4. Select the lightbulbs that are 'on'

### Data Structure and Algorithm

1. Initialize a hash with numbers and boolean (true and false)
   * false represents 'off'; true represents 'on'
2. Define a function that takes 'hash' and a number as arguments and switches the values of the hash keys that are multiple of the number
   1. if hash key is perfectly divisible by the number, switch the value.
   2. otherwise, leave the hash as it is
3. Loop through the hash n times starting at 1 and incrementing to n.
   1. on each iteration pass the hash and the counter through the toogle method
4. When the iteration is completed, select the keys that have `true` as their values

```ruby
def toggle(hash, num)
	keys_to_be_altered = hash.keys.select {|n| n % num == 0}
	keys_to_be_altered.each do |n|
		hash[n] = !hash[n]
	end
end

def on_switches_after_iteration(n)
	hash = (1..n).to_a.product([false])
	1.upto(n) { |i| toggle(hash, i)}
	hash.select {|k, v| v == true}.keys
end
```

