'use strict';

/*
Write a function that returns the length of the shortest contiguous subarray whose sum of all elements strictly exceeds n.

Examples

minLength([5, 8, 2, -1, 3, 4], 9) ➞ 2

minLength([3, -1, 4, -2, -7, 2], 4) ➞ 3
// Shortest subarray whose sum exceeds 4 is: [3, -1, 4]

minLength([1, 0, 0, 0, 1], 1) ➞ 5

minLength([0, 1, 1, 0], 2) ➞ -1

                        Problem
--------------------------------------------------------------
Input: array of numbers, a target number
Output: shortest subarray length whose sum exceeds a given num

Rules:
-return the shortest length if found
-else return -1
                      Clarifications:
--------------------------------------------------------------
Bad Inputs: non array?
Edge Cases: infinity, nan, float

                        Examples
--------------------------------------------------------------
minLength([5, 8, 2, -1, 3, 4], 9) ➞ 2

minLength([3, -1, 4, -2, -7, 2], 4) ➞ 3
// Shortest subarray whose sum exceeds 4 is: [3, -1, 4]

minLength([1, 0, 0, 0, 1], 1) ➞ 5

minLength([1, 0, 0, 0, 1, 1], 1) ➞ 2

minLength([1, 0, 0, -1, 1, 2], 2) ➞ 2

minLength([2, 0, 0, -1, 1, 2], 2) ➞ 2

minLength([0, 1, 1, 0], 2) ➞ -1

minLength([3, -1, 4, -2, -7, 5], 4) ➞ 1

                        Data Structure
--------------------------------------------------------------
arrays

                        Algorithm
--------------------------------------------------------------
-start by testing the shortest subarray: 1
-create a function that takes an array, size, and target num
-the function iterates through the array by taking the slice of the given size
  -- it iterates up to the length minus the size
  -- if the size is 1, iterates through all the elements
  -- if the size is 2, iterates up to the second last element
  -- if the sum of the slice is greater than the given number,
      return the size
  -- else, the function implicitly returns undefined
--increase the length of the subarray untill it finds the desired subarray or reaches the length of the array
--if the size reaches the length and still returns undefined,
  then return -1; otherwise return the return value of the function call
*/

function subArrSum(arr, subArrSize, target) {
  function sum(array) {
    return array.reduce((acc, num) => acc + num, 0);
  }

  for (let idx = 0; idx <= arr.length - subArrSize; idx++ ) {
    let subArr = arr.slice(idx, idx + subArrSize);
    if (sum(subArr) > target) return subArrSize;
  }
}

function minLength(arr, target) {
  let size = 1;
  let minSubArrLength;

  while (size <= arr.length) {
    minSubArrLength = subArrSum(arr, size, target);
    if (minSubArrLength) return minSubArrLength;
    size += 1;
  }

  return -1;
}


console.log(minLength([5, 8, 2, -1, 3, 4], 9) === 2);

console.log(minLength([3, -1, 4, -2, -7, 2], 4) === 3);
// Shortest subarray whose sum exceeds 4 is: [3, -1, 4]

console.log(minLength([1, 0, 0, 0, 1], 1) === 5);

console.log(minLength([1, 0, 0, 0, 1, 1], 1) === 2);

console.log(minLength([1, 0, 0, -1, 1, 2], 2) === 2);

console.log(minLength([2, 0, 0, -1, 1, 2], 2) === 2);

console.log(minLength([0, 1, 1, 0], 2) === -1);

console.log(minLength([3, -1, 4, -2, -7, 5], 4) === 1);

