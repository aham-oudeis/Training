'use strict';

const sequence = (count, start) => {
  let result = [];

  for (let multiplier = 1; multiplier <= count; multiplier += 1) {
    result.push(start * multiplier);
  }

  return result;
}

console.log(sequence(5, 1));          // [1, 2, 3, 4, 5]
console.log(sequence(4, -7));         // [-7, -14, -21, -28]
console.log(sequence(3, 0));          // [0, 0, 0]
console.log(sequence(0, 1000000));    // []

