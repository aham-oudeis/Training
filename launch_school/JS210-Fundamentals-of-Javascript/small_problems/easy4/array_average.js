'use strict';

const average = function (arr) {
  let sum = arr.reduce((total, num) => total + num);
  return Math.floor(sum / arr.length);
};

console.log(average([1, 5, 87, 45, 8, 8]));       // 25
console.log(average([9, 47, 23, 95, 16, 52]));    // 40
