'use strict';

const fibonacci = function fib(num) {
  if (num < 0) {
    return null;
  }

  fib[0] = 0;
  fib[1] = 1;
  fib[2] = 1;

  if (!fib[num] && num !== 0) {
    fib[num] = fib(num - 1) + fib(num - 2);
  }

  return fib[num];
};

console.log(fibonacci(0));
console.log(fibonacci(2));
console.log(fibonacci(5));
console.log(fibonacci(10));
console.log(fibonacci(15));
console.log(fibonacci(12));
console.log(fibonacci(20));
console.log(fibonacci(78));
