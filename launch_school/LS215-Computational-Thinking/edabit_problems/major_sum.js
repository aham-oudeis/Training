'use strict';

/*
Create a function that takes an integer array and return the biggest between
positive sum, negative sum, or 0s count. The major is understood as the greatest
absolute.

arr = [1,2,3,4,0,0,-3,-2], the function has to return 10, because:

    Positive sum = 1+2+3+4 = 10
    Negative sum = (-3)+(-2) = -5
    0s count = 2 (there are two zeros in array)


strategy
-filter positives and reduce sum
-filter negatives and reduce sum
-filter zeros and count

majorSum([1, 2, 3, 4, 0, 0, -3, -2]) ➞ 10

majorSum([-4, -8, -12, -3, 4, 7, 1, 3, 0, 0, 0, 0]) ➞ -27

majorSum([0, 0, 0, 0, 0, 1, 2, -3]) ➞ 5
// Because -3 < 1+2 < 0sCount = 5

*/

function majorSum(numbers) {
  const sum = (a, b) => a + b;
  let positives = numbers.filter(item => item > 0).reduce(sum);
  let negatives = numbers.filter(item => item < 0).reduce(sum);
  let zeros = numbers.filter(item => item === 0).length;

  const absoluteCompare = (a, b) => Math.abs(b) - Math.abs(a);
  return [positives, negatives, zeros].sort(absoluteCompare)[0];
}

console.log(majorSum([1, 2, 3, 4, 0, 0, -3, -2]) === 10);
console.log(majorSum([-4, -8, -12, -3, 4, 7, 1, 3, 0, 0, 0, 0]) === -27);
console.log(majorSum([0, 0, 0, 0, 0, 1, 2, -3]) === 5);
// Because -3 < 1+2 < 0sCount = 5
