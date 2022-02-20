'use strict';

function negative(num) {
  //not perfect because it does not return negative if input is -0
  return num < 0 ? num : -num;
  // a better solution to get -0 for -0 is
  // Math.abs(num) * -1;
}

console.log(negative(5));     // -5
console.log(negative(-3));    // -3
console.log(negative(0));     // -0
console.log(negative(-0));     // -0
