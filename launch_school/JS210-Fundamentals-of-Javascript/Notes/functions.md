# Functions

Key points:

1. Function create an inner scope.
2. Functions are first-class citizens, meaning they can be treated like any other value:
  i. Functions can be assigned to a variable
  ii. Functions can be passed as arguments to other functions
  iii. Functions can be returned from a function call
3. Functions have lenient arity, meaning js won't complain about the number of arguments supplied.
4. Functions without a `return` keyword implicitly returns `undefined`

__Nested Functions__: They are created and destroyed every time the outer function runs. They cannot be accessed outside of the function where they are defined.

__Function composition__:Using function invocations as an argument to another function. For example: `console.log(String(undefined))`.


# Arity

```javascript
function takeTwo(a, b) {
  console.log(a);
  console.log(b);
  console.log(a + b);
}

takeTwo(1, 2);

// logs:
1
2
3

takeTwo(1);

// logs:
1
undefined
NaN
```

 1. Calling a function with too few arguments does not raise an error.
 2. Within a function, an argument that wasn't provided in the call will have the value undefined.
 3. The `NaN `result is caused by the fact that `b` is undefined; it isn't a direct result of the missing parameter. It is merely JavaScript's standard behavior when a number and undefined are added.


