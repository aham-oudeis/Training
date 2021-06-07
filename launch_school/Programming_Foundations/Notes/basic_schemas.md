<!--Initialization-->

On line `some_num` of this code the local variable `var_name` is initialized to the string object / array object / hash object with value ` some_value` to it. 

On line `some_num` the local variable `var_name` is reassigned to a different string/integer/array object. That means, the local variable `var_one` and `var_two` are now pointing to different objects. While `var_one` points to the object with value `some_value`, `var_two` points to the object with value `another_value`.

<!--Variable Scope -->

This demonstrates the concept of variable scope, specially the idea that variables initialized outside the block are accessible inside the block but not vice versa. 

This demonstrates the concept of variables as pointers. And this also demonstrates the concept of variable scope, in particular, the idea that local variables initialized outside the method cannot be reassigned from inside the method; however, the objects they point to are accessible inside the method only if the variables are passed in as arguments.

<!--Variable Shadowing -->

On `line X` we are calling `some_method` and passing `do..end` block as an argument with one parameter `parameter_name`.

Variable shadowing happens when a block's parameter has the same name as a local variable initialized in the outer scope or outside the block. When this happens, variables  initialized outside the block that share the same name with the parameter are no longer accessible from inside the block. 

<!-- Method Calls -->

When we invoke the method `M` and pass `Y` as an argument, the method internally assigns the parameter `X` to the object that `Y` points to and makes it available to the method body. At this point, both `Y` and `X` point to the same object.

<!-- Mutating Methods -->

in `line X` calling the mutating method `some_method` on 'parameter' with the argument `"arg"` further mutates the string object to `"mutated_object"`

in `line X`, invoking `method` method on  `variable` and passing `"arg"` as an argument, mutates the object `variable` points to. The object become `"mutated_object"`; at this point both the method parameter `variable` and the local variable `some_var` are pointing to this object.

<!-- Truthiness -->

In Ruby any expression that does not return `false` or `nil` is considered truthy. 

