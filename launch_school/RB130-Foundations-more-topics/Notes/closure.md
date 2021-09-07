## Closure

Closure is a programming technique for storing/bundling a function together with an environment. It is what enables programmers to save a chunk of code and execute it later. It's called closure because it forms a binding with the surrounding artifacts (variables, methods, and objects) and forms an enclosure around it so that they can be referenced when the code is executed later. What it means to form a binding is that it retains a memory of the environment it was created in.

It's the binding that explains why we can reassign local variables from inside a block, but cannot access variables initialized inside the block from outside.

Ruby implements closures in three ways:
1. creating objects from Proc class
2. __lambdas__
3. blocks
