'use strict';

function isDouble(num) {
  let numStr = String(num);
  let length = numStr.length;

  if (length % 2 === 1) {
    return false;
  } else {
    let half = length / 2;
    let firstHalf = numStr.slice(0, half);
    let secondHalf = numStr.slice(half);
    return (firstHalf === secondHalf);
  }
}

function twice(num) {
  if (isDouble(num)) {
    return num;
  } else {
    return num * 2;
  }
}

console.log(twice(37));
console.log(twice(44));
console.log(twice(334433));
console.log(twice(444));
console.log(twice(107));
console.log(twice(103103));
console.log(twice(3333));
console.log(twice(7676));
