'use strict';

function rotateArray(arr) {
  if (!Array.isArray(arr)) {
    return undefined;
  }

  if (arr.length === 0) {
    return [];
  }

  return arr.slice(1).concat(arr[0]);
}

function rotateRightmostDigits(integer, lastNumOfDigits) {
  let digits = [...String(integer)];
  let digitsToRotate = digits.slice(-lastNumOfDigits);
  let rotatedDigits = rotateArray(digitsToRotate);
  let joinedDigits = digits.slice(0, -lastNumOfDigits).concat(rotatedDigits);
  return Number(joinedDigits.join(''));
}

function rotateRightmostDigits(integer, numOfDigits) {
  let digits = [...String(integer)];
  let digitToRotate = digits.splice(-numOfDigits, 1);
  return Number(digits.concat(digitToRotate).join(''));
}

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917

function maxRotation(integer) {
  let intLength = String(integer).length;

  for (let digits = intLength; digits >= 1; digits--) {
    integer = rotateRightmostDigits(integer, digits);
  }

  return integer;
}

console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845
