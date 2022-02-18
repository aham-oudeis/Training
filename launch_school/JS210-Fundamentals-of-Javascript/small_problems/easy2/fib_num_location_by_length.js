let findFibonacciIndexByLength = function fib(num) {
  if (num === 1) {
    return 1;
  }

  let fibFirst = 1n;
  let fibSecond =  1n;
  let fibNum;
  let index = 2n;
  let length;

  while (length !== num) {
    index += 1n;
    fibNum = fibFirst + fibSecond;
    [fibFirst, fibSecond] = [fibSecond, fibNum];
    length = String(fibNum).length;
  }

  return index;
};

console.log(findFibonacciIndexByLength(2) === 7n);
console.log(findFibonacciIndexByLength(3) === 12n);
console.log(findFibonacciIndexByLength(10) === 45n);
console.log(findFibonacciIndexByLength(16) === 74n);
console.log(findFibonacciIndexByLength(100) === 476n);
console.log(findFibonacciIndexByLength(1000) === 4782n);
console.log(findFibonacciIndexByLength(10000) === 47847n);

// The last example may take a minute or so to run.
