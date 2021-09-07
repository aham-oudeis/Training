## Blocks

We can illustrate the concept of closure in regards to blocks by showing how it gives rise to the specific local variable scoping rule: a local variable initialized in the outer scope can be reassigned from the inner scope, but the local variable initialized in the inner scope cannot be accessed from the outer scope.

```ruby
name = "Grace"
loop {name = "Lily"; break}

p name
```
Since the block passed to the `loop` method retains a memory of the enviroment (where the local variable `name` is initialized to `"Grace"`), reassigning the value of `name` to `"Lily"` inside the block affects the value of `name` in the outer scope; hence, the reassignment is reflected when we pass `name` to the `p` method invocation.

The mechanism by which the block has access to the variables initialized in the outer scope is __binding__.

But when we initialize a local variable inside of the block, it is not available in the outer scope.

```ruby
loop { name = "Lily"; break}

p name # => Throws a NameError
```

That means, in addition to creating their own scope, blocks retain a memory of the environment where they are created.

These blocks are created in the main scope, but executed from inside the method invocation. But if the method invocation is not designed to execute the block, then the code inside the block is not executed, even though it is created and passed to the method.

```ruby
name = "Grace"
puts(name) { name = "Lily"} # All method in ruby take implicit blocks

p name # => "Grace"
```

The `puts` method is not designed to execute the code; hence, the reassignment inside the block is not executed.