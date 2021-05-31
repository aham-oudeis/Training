Ten_minute_walk

### Problem

Input: array of directions as characters

Output: boolean based on the following conditions:
		*  Does the array have exactly 10 elements?
		*  Does the array of directions lead back to the starting point?
		*  if yes to both, return `true`; else, return `false`

### Data Structure and Algorithm

1. return `false` if the array size is not equal to 10.
2. initiialize a stack to keep track of where the direction ends
3. initialize a hash containing the cancelling pairs. 
   *  'n' => 's'
   * 's' => 'n'
   * 'e' => 'w'
   * 'w' => 'e'
4. Loop through the given array and carry out the following steps:
   	1. If the hash value of the element is the last element in the stack, then pop the stack
    	2. otherwise, push the element to the stack
5. check if the stay is empty

```ruby
CANCEL_PAIRS = { 'n' => 's'
                 's' => 'n'
                 'e' => 'w'
                 'w' => 'e' }

def is_valid_walk(arr)
  return false if arr.size != 10
  stack =[]
  arr.each do |item|
    if CANCEL_PAIRS[item] == stack.last
      stack.pop
    else
      stack.push(item)
    end
  end
  stack.empty?
end
```

