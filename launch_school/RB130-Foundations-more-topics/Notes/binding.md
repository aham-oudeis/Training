## Binding

Binding is the mechanism by which closures retain a memory of the environment they were created in.

For instance:

```ruby
SCHOOL = "Launch School"
name = "Dor"

greet = proc { puts "Hi! I am #{name}! I am attending #{SCHOOL}." }

def call_proc(obj)
  obj.call
end

call_proc(greet)
# => Hi! I am Dor! I am attending Launch School.
```

In this example, the `greet` proc is created in the main scope. The local variable `name` and the constant `SCHOOL` are accessible from inside the proc. The proc object forms a binding with the artifacts that were in scope.

```ruby
SCHOOL = "Launch School"
name = "Dor"

greet = proc { puts "Hi! I am #{name}! I am attending #{SCHOOL}." }

def call_proc(obj)
  obj.call
end

name = "Pascal"

call_proc(greet)
# Hi! I am Pascal! I am attending Launch School.
```

Similarly, in this case, the `greet` proc retains a memory of the scope in which it was created. Since the local variable `name` is reassigned in the same scope before we call the proc object, the proc object when called references the new value of the local variable.

Since methods have a self-contained scope, we can create proc objects that have different bindings.

```ruby
def counter
  count = 0
  proc { count += 1 }
end

first_counter = counter
second_counter = counter

puts "First counter"

p first_counter.call
p first_counter.call
p first_counter.call

puts
puts "Second counter"
p second_counter.call
p second_counter.call
p second_counter.call
```

In this case, the binding of the proc in the `first_counter` is different from the binding of the proc in the `second_counter`. For this reason, when we call the proc of `first_counter`, it does not affect the binding of the `second_counter`.

Furthermore, we can create different kinds of procs to suit our purposes by having a function return a proc.

```ruby

def power_of(num)
  proc { |n| n ** num }
end

square = power_of(2) # => returns a proc that works as a way of squaring a number
cube = power_of(3) # => returns a proc that works as a way of cubing a numb

p square[5] # => 25
p cube[5] # => 125
```