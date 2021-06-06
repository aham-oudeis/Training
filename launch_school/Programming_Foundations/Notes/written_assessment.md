<!-- Local Variable Scope -->

#### Example 1

```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b

```

The code outputs `Goodbye` and `Hello` and returns nil, because 

* on `line 4` we invoke `puts` method and pass in `a` as an argument. Since `a` is initialized to string object `'Hello'` in `line 1` and then reassigned to string object `Goodbye` in `line 3`. Since there is no further reassignment of `a`, `puts` method outputs `Goodbye` and returns `nil`
* on `line 4` we invoke `puts` method and pass in `b` as an argument. Since `b` is initialized to string object that `a` points to, i.e., `'Hello'`,  in `line 1`  and  there is no further reassignment of `b`, `puts` method outputs `Hello` and returns `nil`.
* Since the last expression `puts b` returns `nil`, the code returns `nil`. 

This demonstrates the concept of variables as pointers.



#### Example 2

```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```



`line 9` outputs `5` and `line 10` throws an error, because

* in `line 9` we invoke the `puts` method and pass in the local variable `a` as an argument. The local variable `a` is initialized in `line 1` to the Integer object `4` but reassigned to the interger object `5` inside the block, which is passed in as an argument to the `loop` method call. The loop break after initializing the local variable `b` to the integer object `3`. Since there is no further reassignment of `a`, `line 9` outputs `5` and returns `nil`. 
* in `line 10` we invoke the puts on the local variable `b` but since the variable initialized inside the block is not accessible outside the block, the program throws an error saying that the variable or method is not defined. 

This demonstrates the concept of variable scope, specially the idea that variables initialized outside the block is accessible inside the block but not vice versa. 

### Example 3

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

`line 10` outputs `3` and returns `nil` and `line 11` outputs `2` and returns `nil`, because

* in `line 1` the local variable `a` is initialized to the integer object `4`
* in `line 4` we invoke the `loop` method and pass in a block as an argument, within which we initialiize the local variable `c` to the integer object `3`  and reassign `a` to the object that `c` points to, i.e., `3`. The loop breaks. 
* since there is no further reassignment, `a` now points to `3`
* Hence, when we inovke the `puts` method and pass in `a` in `line 10`, it outputs `3` and returns `nil`.

And 

* In `line 2` the local variable `b` is initialized to `2` and since the variable is not reassigned, `b` till points to `2`. In `line 11` when we invoke the `puts` method and pass in `b` as an argument, it outputs `2` and returns `nil`. 

This demonstrates the concept of variable scope. In particular, it demonstrates the idea that local variables initialized outside the block are accessible from inside the block. 

### Example 4

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

On `line 10` we invoke the method `example` and pass in the string literal `'hello'` as an argument. It outputs `'hello'` three times and returns `nil`, because

* the method `example` is defined with a parameter `str`. When the `example` method is invoked in `line 10`, method parameter `str` points to the string object `'hello'`
* we initialize a local variable `i` to the integer object `3` and invoke the `loop` method
* This string object is passed in as an argument to the `puts` method call in line 4 within the block passed in as an argument to the `loop` method call. 
* the loop runs three times and breaks by reassigning the value of `i` to `i - 1`. 

This demonstrates the variable scoping. In particular, it demonstrates the idea that within the method body the variables initialized outside the block is accessible inside the block. 

### Example 5

```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)
```

`line 8` outputs `'Hello'` and `'Goodbye'` and return `nil`, because

* in `line 6` we initialize the local variable `word` to the string object `'Hello'`
* in `line 8` we pass in the local variable `word` as an argument to the method call `greetings`
* since in `line 1-4` the method `greeting` is defined with a parameter `str`, when we invoke the method `greetings` with `word` as an argument, both the method parameter `str` and the local variable `word` point to the same string object `'Hello'`. 
* inside the method body, we invoke the `puts` method and pass in `str` as an argument. This outputs `Hello` to the console and returns nil.
* Next, we invoke the `puts` method and pass in `'Goodbye'` as an argument. This outputs  `'Goodbye'` and returns `nil`.

This demonstrates the concept of variable scope, in particular, the idea that local variables initialized outside the method is acccessible inside the method only if they are passed in as arguments.

### Example 6

```ruby
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

 

`line 12` outputs `Your total is 10` and returns `nil`, because

* in `line 12` we invoke the puts method and pass in the string `"Your total is #{sum}"` with the string interpolation of the local varible `sum`. 
* in `line 1`, the local variable `arr` is initialized to the array object `[1, 2, 3, 4]`
* the local variable `counter` is initialized in `line 3` to `0` .
* the local variable `sum` is initialized in `line 4` to `0` .
* in `line 6` we invoke the `loop` method and pass in the `do..end` block within which we reassign the value of `sum` by adding each element of `arr`. 
* we break the loop when it iterates through the array `arr`
* At this point, the value of `sum` is `10`. 

This demonstrates the concept of variable scoping, especially, the idea that the local variable initialized outside the block is accessible inside the block. 



### Example 7

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```

`line 7` outputs `"Bill"` to the console and returns the same string object, because

the local variable `a` initialized in `line 1`  to the string object `Bob` is then reassigned inside the block in `line 4` to the string object `"Bill"` This reassignment happens 5 times because the block is part of the `times` method invocation. Hence, in `line 7` the local variable `a` points to the string object `"Bill"` and since `a` is passed in as an argument to the `p` method invocation, it outputs  `"Bill"` to the console and returns the same string object.

This demonstrates the concept of variable scoping, in particular, the idea that local variable initialized outside the block is accessible inside the block.



<!-- Variable Shadowing -->

### Example 1

```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```

The code outputs `5`, `5`, `4`, `2` in that order and returns `nil`, because

1. in `line 4-7`, we invoke the method `times` on the integer object `2` and pass in the block with parameter `a`. Since the parameter shares the same name `a` with the local variable, the inner scope created by the block does not have access to the local variable `a` defined outside the block. Inside the block the local variable `a` is reassigned to the integer object `5` and it is output to the console two times. 
2. in `line 9` the local variable `a` is passed in as an argument to the method `puts`. Since the value of `a` is initialized to the integer object `4` in `line 1` and not reassigned later, it `a` retains the same value. Hence, `line 9` outputs `4` and returns `nil`
3. in `line 10` the local variable `b` is passed in as an argument to the `puts`  method. since the value of `b` is initialiized to the integer object `2` and is not reassigned later, it still points to the same object. Hence, `line 10` outputs `2` and returns `nil`. Since this is the last line of the code, the code returns `nil`. 

This demonstrates the concept of variable shadowing. In particular, the `line 4-5` shows an instance of variable shadowing, which implies that when the block parameter shares the same name as the local variable initialized outside the block, access to the local variable outside the block is prevented access inside the block. Hence, the value of `a` is not reassigned. 



### Example 2

```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
```

This code outputs `10` to the console and returns `nil`, because

1. the local variable `n`  initialized in `line 1` to the integer object `10` is no reassigned later in the program.
2. the local variable `n` is passed in as an argument to the `puts` method
3. Hence, the output is `10` and return value is `nil`.

This demonstrates the concept of variable shadowing as instantiated in `line 3-4`. Since the block parameter `n` shares the same name as the local variable initialized in `line 1`, the latter is no longer accessible inside the block. When `n` is reassigned in `line 4`, this only changes what the parameter points to and does not affect the local variable `a` initialized in `line 1`. 

### Example 3

```ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
```

The code returns `nil` because the last line is a `puts` method invocation with an argument `animal`. It outputs '"dog"', because the local variable `animal` is initialized to the string object `"dog"` in `line 1` and is not reassigned within the block. 

Although the `do..end` block in `line 3-6`  passed to the `loop` method call in `line 3` reassigns the local variable `animal` to `"cat"`, this reassignment does not affect the local variable initialized outside the scope, because the block parameter shares the same name `animal` with the local variable initialized in the outer scope.

This demonstrates the concept of variable shadowing. 



<!-- Object Passing / Variable as Pointers -->

### Example 1

```ruby
a = "hi there"
b = a
a = "not here"
```

The code returns the string object `"not here"`. It does not output anything. 

In `line 1` the local variable `a` is initialized to the string object `"hi there"`. In `line 2` the local variable `b` is initalized and points to string object that the local variable `a` points to. Then in `line 3` the local variable is reassigned to the string object `"not here"`. At this point local variable `a` and `b` point to two distinct string objects. Since the last line evaluates to `"not here"`, the same string is returned. 

This demonstrates the concept of variables as pointers. 

### Example 2

```ruby
a = "hi there"
b = a
a << ", Bob"
```

The code returns `"hi there, Bob"` and does not output anything, because the local variable `a` is initialized to the string object `"hi there"` and we call the `<<` method on `a` and pass in the string `", Bob"` as an argument. Since `<<` method is destructive, it mutates the caller by appending the argument to the caller, i.e, the string object "hi there"  is mutated to `"hi there, Bob"`. This what is returned. 

This demonstrates the concept of object passing and mutating methods. 

### Example 3

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```



In `line 1` the local variable `a` is initialized to the array object `[1, 2, 3, 3]`. In `line 2` the local variable `b` is initalized and assigned to the same object that `a` points to. In `line 3` the local variable `c` is initialized and assigned to the return value of calling the `uniq` method on `a`, which returns `[1, 2, 3]`. The `upcase` method is non-destructive and returns a new array object. It is this new array object that the local variable `c` points to. 

If the last line was `c = a.uniq`, the object that `a` points to would be mutated to `[1, 2, 3]` and the local variable `c` points to this array. At thiis point, all three local variables `a`, `b`, and `c` point to the same mutated array `[1, 2, 3]`.

This demonstrates the concept of variables as pointers. 

### Example 4

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```



`line 6` returns the following array:

`["I like the letter: a", "I like the letter: b", "I like the letter: c"]`

Because 

1. On `line 5` we initialize the local variable `a` to the array object `['a', 'b', 'c']` and on `line 6` we call the `test` method and pass in `a` as an argument. 
2. On `line 1-3` we define the `test` method with the parameter `b`. When we call the `test` method with `b` as an argument, both the parameter `b` and the local variable `a` points to the same array  `['a', 'b', 'c']` . 
3. Inside the method, in `line 2` we call the `map` method on `b` and pass the block `{|letter| "I like the letter: #{letter}"}`. `map` method iterates through the array and sends each element to the block and runs it. Since `map` method returns an array containing the values returned by the block and the this `map` method call is the last expression in the `test` method body, `test(a)` returns `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`. 

This demonstrates the concept of transformation, object passing, and non-mutating method. 

### Example 5

```ruby
a = 5.2
b = 7.3

a = b

b += 1.1
```

The code returns the float object `8.4` and does not output anything, because the loca variable `b` is reassigned to the return value of calling `+` method on the local variable `b` and passing `1.1` as an argument. Since the local variable is initialized to the float object `7.3` in `line 2`, the local variable `b` is reassigned in `line 6` to `7.3 + 1.1`, i.e., `8.4`.  After this reassignment, the local variable `b` points to a different float object. 

This demonstrates the concept of variable as pointers.

### Example 6

```ruby
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```

The code outputs `Written Assessment` and returns `nil`, because on the last line we we call the `puts` method and pass in   `test-str` as an argument. Since `puts` always returns `nil`, the return value is `nil`. As for the value of the `test_str`, we can see that the local variable `test_str` is initialized to the string object `"Written Assessment"` and is passed as an argument  to the  `test` method. When we we invoke the method `test` and pass `test_str` as an argument, the method internally assigns the parameter `str` to the object that `test_str`  points to and makes it available to the method body. Although initially `str` and `test_str` point to the same string object, the local variable `str` is reassigned to the return value of concatenating `str` with `"!"`. This string concatenation returns a different string and hence `str` is reassigned to a different object than what 'test_str` points to. After this reassignment, the object that `test_str` points to is no longer available to the method body. Hence, the `test_str` retains its original value, i.e, `"Written Assessment"`. 

This demonstrates the concept of variables as pointers.

### Example 7

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)


puts a
puts b
```

the program outputs `3` (from `line 9`) and `5`  (from `line 10`) and returns `nil`. It returns `nil` because the last expression is a `puts` method invocation, which always returns `nil` if executed without an error. 

In `line 5` the local variable `a` is initialized to the integer object `3`. In `line 6` the local variable `b` is initialized to the return value of invoking the method `plus` with two arguments, `a` and `2`. Within the method body `x + y` evaluates to `5` and is reassigned to the local variable `x`. But this affects neither the local variable passed in as an argument nor the object it points to. Since `plus(a, 2)` returns `5`, the local variable `b` is initialized to `5`. 

we call the `puts` method and pass in `a` in `line 9`. This outputs `3` and returns `nil`. 
we call the `puts` method and pass in  `b` in `line 10`. This outputs `5` and returns `nil`. 

This demonstrates the concept of variables as pointers. This also demonstrates the concept of return value of method calls. When we assign a variable to a method call, the variable is assigned to the return value of the method call. 