'use strict';

function isValidTriangle(side1, side2, side3) {
  let zeroSide = [side1, side2, side3].some(length => length <= 0);

  if (zeroSide) return false;

  let [maxSide, ...rest] = [side1, side2, side3].sort((a, b) => b - a);
  let sumOfShorterSides = rest.reduce((a, b) => a + b);

  return maxSide < sumOfShorterSides;
}

function triangle(s1, s2, s3) {
  if (!isValidTriangle(s1, s2, s3)) return 'invalid';

  if ([s2, s3].every(side => side === s1)) {
    return 'equilateral';
  } else if ([s2, s3].every(side => side !== s1) && s2 !== s3) {
    return 'scalene';
  } else {
    return 'isoceles';
  }
}
console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"
