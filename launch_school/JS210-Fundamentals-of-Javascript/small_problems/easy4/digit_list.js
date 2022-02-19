'use strict';

function digitList(num) {
  let digits = [];
  let remainder;

  while (num > 0) {
    remainder = num % 10;
    num = Math.floor(num / 10);
    digits.push(remainder);
  }

  console.log(digits.reverse());
  return digits.reverse();
}

digitList(12345);       // [1, 2, 3, 4, 5]
digitList(7);           // [7]
digitList(375290);      // [3, 7, 5, 2, 9, 0]
digitList(444);         // [4, 4, 4]
