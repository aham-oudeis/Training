'use strict';

function numbersUpto(num) {
  let coll = [];

  for (let int = 1; int <= num; int++) {
    coll.push(int);
  }

  return coll;
}

function sumSquareDifference(num) {
  const sum = (a, b) => a + b;
  const square = a => a ** 2;

  let numbers = numbersUpto(num);
  let total = numbers.reduce(sum);
  let squareOfNumbers = numbers.map(square);

  return (square(total)) - squareOfNumbers.reduce(sum);
}

/*
How to solve this mathematically?

sum of numbers up to a given number n: n(n + 1) / 2;

and then iterate only once to get the sum of squares:
*/

function sumSquareDifference(num) {
  const square = a => a ** 2;

  let sum = (num * (num + 1)) / 2; //formula for the sum upto a given number

  let sumOfSquares = 0;

  for (let int = 1; int <= num; int ++) {
    sumOfSquares += square(int);
  }

  return square(sum) - sumOfSquares;
}

console.log(sumSquareDifference(3));      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));     // 2640
console.log(sumSquareDifference(1));      // 0
console.log(sumSquareDifference(100));    // 25164150
