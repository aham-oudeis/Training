Variable_Scope

<!-- Variable Scope -->

outer and inner scope

variables initialized inside a block has an _inner scope_

`for` , `while`, `untill`, `if`, `unless`, __do not__ create an inner scope.

that is, variables initialized inside `for` , `while`, `untill`, `if`, `unless` are accessible outside; actually, since they don't create an inner scope, it is a bit misleading to talk in terms of outside and inside. 

But, blocks that are passed in as argument to method calls do create an inner scope. While the variables initialized in inner scope are not accessible outside, the variables initialized outside are accessible inside __unless__ variable shadowing comes into play. 

```ruby
a = 'something'

loop do
  a = 'nothing'
  break
end

p a ==> 'nothing'
```



Here, the variable `a` is initalized in the outer scope to a string object with value 'something'. This `a` is accessible from the inner scope defined by the block that is passed to the `loop` method. In the inner scope the variable is reassigned to a new string object 'nothing'. Before, `a` pointed to a string object `something`; after the reassignment, `a` points to another string object `nothing`. To see this, we can do the following:

```ruby
a = 'something'
p a.object_id

loop do
  a = 'nothing'
  break
end

p a ==> 'nothing'
p a.object_id
```

The object_id of a before the loop and after the loop must be different. 

However, things would be different, if we had modified the original string object.

```ruby
a = 'something'
p a.object_id

loop do
  a.replace 'nothing'
  break
end

p a #==> 'nothing'
p a.object_id
```

In this case, the object_id of  `a` must be the same before and after the loop. The reason for this is that inside the loop, we called the method `replace` on the string object that `a` pointed to. This method mutates the object by putting new value in the string object that `a` was originally pointing to. 