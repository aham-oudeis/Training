'use strict';


/*
Write a function that returns true if you can partition an array into one element and the rest, such that this element is equal to the product of all other elements excluding itself.
Examples

Algorithm
-calculate the product of the array
-check if the array element is such that the product divided by the element is equal to the element

canPartition([2, 8, 4, 1]) ➞ true
// 8 = 2 x 4 x 1

canPartition([-1, -10, 1, -2, 20]) ➞ false

canPartition([-1, -20, 5, -1, -2, 2]) ➞ true
*/

function canPartition(arr) {
  // fails when there are zeros in the array
  let product = arr.reduce((acc, num) => acc * num, 1);

  return arr.some(num => {
    return (product / num) === num;
  });
}

function leftMultiples(arr) {
  let multiple = 1;

  return arr.map(num => {
    let leftMult = multiple;
    multiple *= num;
    return leftMult;
  });
}

function canPartition(arr) {
  let multiplesOnLeft = leftMultiples(arr);
  let multiplesOnRight = leftMultiples(arr.slice().reverse()).reverse();

  return arr.some((num, idx) => {
    return multiplesOnLeft[idx] * multiplesOnRight[idx] === num;
  });
}
console.log(canPartition([2, 8, 4, 1]) === true);
// 8 = 2 x 4 x 1

console.log(canPartition([-1, -10, 1, -2, 20]) === false);

console.log(canPartition([-1, -20, 5, -1, -2, 2]) === true);
