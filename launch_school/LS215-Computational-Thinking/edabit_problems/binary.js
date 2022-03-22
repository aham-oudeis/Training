'use strict';

/*
Convert a number to base 2

Input: number
Output: a string with the binary representation of the number

Approach:
10 / 2 == 5 remains 0
5 / 2 == 2 remains 1
2 / 2 == 1 remains 0
1 / 2 == 0 remains 1

19 / 2 == 9 remains 1
9 / 2 == 4 remains 1
4 / 2 == 2 remains 0
2 / 2 == 1 remains 0
1 / 2 == 0 remains 1
*/

function binary(num) {
  let sign = num < 0 ? '-' : '';
  num = Math.abs(num);

  let binaryStr = '';
  let remainder;

  do {
    remainder = num % 2;
    binaryStr = String(remainder) + binaryStr;
    num = Math.floor(num / 2);
  } while (num !== 0)

  return sign + binaryStr;

  //more concisely: Number(num).toString(2)
}

console.log(binary(0));
console.log(binary(1));
console.log(binary(10));
console.log(binary(5));
console.log(binary(19));
console.log(binary(-19));
