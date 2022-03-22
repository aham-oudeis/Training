'use strict';

function countTrue(arr) {
  let count = 0;

  arr.forEach(item => {
    if (item === true) count += 1;
  });

  return count;
}

console.log(countTrue([true, false, false, true, false]));
console.log(countTrue([false, false, false, false]));
console.log(countTrue([]));
console.log(countTrue([false, false, true, true, false, false, false, true, true, true, true, false, true, true, false]));
console.log(countTrue([true, false, true, true, false, false, false, false, false]));
console.log(countTrue([false, true, true, false, true, true, false, true, false, true, false, true, false, true, false]));
console.log(countTrue([true, false, true, true, true, false, true, true, false, false]));
console.log(countTrue([false, false, false, false, true, false, true, false, true, false, false]));
console.log(countTrue([true, false, false, false, true, false, false, true, false, false, false]));
console.log(countTrue([true, true, false, true, false, false, false, false, true, false]));
console.log(countTrue([true, false, true, true, false, true, true, true, true, false, true, false, true, false]));
console.log(countTrue([true, false, true, true, true, true, false, true, true, false, true, false, false, false, false]));
console.log(countTrue([true, true, false, false, false, false, true, false, true, true, false, true]));
