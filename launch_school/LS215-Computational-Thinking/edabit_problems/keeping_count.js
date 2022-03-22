'use strict';

/*
Given a number, create a function which returns a new number based on the following rules:

    For each digit, replace it by the number of times it appears in the number.
    The final instance of the number will be an integer, not a string.

The following is a working example:

digitCount(136116) ➞ 312332
// The number 1 appears thrice, so replace all 1s with 3s.
// The number 3 appears only once, so replace all 3s with 1s.
// The number 6 appears twice, so replace all 6s with 2s.

digitCount(221333) === 221333

digitCount(136116) === 312332

digitCount(2) === 1
*/

function count(str) {
  let frequencies = {};

  [...str].forEach(char => {
    frequencies[char] = frequencies[char] || 0;
    frequencies[char] += 1;
  });

  return frequencies;
}

function digitCount(num) {
  let numStr = num.toString();
  let frequencies = count(numStr);

  let digits = [...numStr].map(digit => frequencies[digit]).join('');

  return parseInt(digits);
}

console.log(digitCount(221333) === 221333);

console.log(digitCount(136116) === 312332);

console.log(digitCount(2) === 1);
