<!--Initialization-->

On line `some_num` of this code the local variable `var_name` is initialized to the string object / array object / hash object with value ` some_value` to it. 

On line `some_num` the local variable `var_name` is reassigned to a different string/integer/array object. That means, the local variable `var_one` and `var_two` are now pointing to different objects. While `var_one` points to the object with value `some_value`, `var_two` points to the object with value `another_value`.

### Example

The code outputs `'hello'` three times and returns `nil`, because

On `line 10` we invoke the `example` method and pass `'hello'` as an argument, which invokes the method defined between `line 1` and `line 8`. 

On `line 1` we define the method `example` with parameter `str`. At this point, `str` points to the string object `'hello'` and makes it available to the method body.

On `line 2` we initialize a local variable `i` to an integer object with value `3`. 

On `line 3` we invoke the `loop` method call and pass in a `do..end` block, within which in `line 4`, we invoke the `puts` method and pass in the variable `str` as an argument. This outputs `'hello'` to the console.

On `line 5` we substract `1` from `i` which points to '3' and reassign the result to `i`. Since `3 - 1` evaluates to 2, the local variable `i` is reassigned to 2. 

The loop continues since `i` is not equal to `0`. On the second iteration, it outputs `hello` to the console and reassigns the value of `i` to `1`. On the third iteration, it outputs `hello` to the console and reassigns the value of `i` to `0` and the loop breaks. 

This demonstrates the concept of variable scope and variable reassignment. 



<!--Variable Scope -->

Stock phrase

local variables initailized in an inner scope cannot be accessed in the outer scope, but local variables initialized in the outer scope can be accessed in the inner scope. 



<!--Variable Shadowing -->

Stock phrase

On `line X` we are calling `some_method` and passing `do..end` block as an argument with one parameter `parameter_name`.

Variable shadowing happens when a block's parameter has the same name as a local variable initialized in the outer scope or outside the block. When this happens, variables  initialized outside the block that share the same name with the parameter are no longer accessible from inside the block. 