'use strict';

const reverseNumber = function (num) {
  let digits = String(num).split('');
  return parseInt(digits.reverse().join(''), 10);
};

console.log(reverseNumber(12345));    // 54321
console.log(reverseNumber(12213));    // 31221
console.log(reverseNumber(456));      // 654
console.log(reverseNumber(12000));    // 21 -- Note that zeros get dropped!
console.log(reverseNumber(1));        // 1
