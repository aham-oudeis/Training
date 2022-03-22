'use strict';

/*
Pyramid Arrays

Input: integer
Output: array with size of the integer, containing arrays, such that the first array contains 1 element and second array contains 2 as its element, and so on. Each nested array has the size equal to the element it contains.

Approach:
-create a function that takes an integer and returns an array of that size with all its elements as the given integer
-main function: start a for loop at 1 and up to the given integer
-for each value of i, call the other function and append the value to the collectiion

Pseudocode:
-initialize a variable to an empty array (coll)
-start a for loop from 1 to the given integer (num)
-in each iteration, pass the current value to the function that generates the array of that size
-append the return value of the function call to coll
-return the coll array

Helper function:
-initialize an empty array
-change the size of the array to the given number
-fill the array with that number
*/

function createArray(size) {
  let arr = [];
  arr.length = size;
  return arr.fill(size);
}

function pyramidArrays(num) {
  let collection = [];

  for (let len = 1; len <= num; len++) {
    collection.push(createArray(len));
  }

  return collection;
}

console.log(pyramidArrays(1)); // [[1]]
console.log(pyramidArrays(2)); // [[1], [2, 2]]
console.log(pyramidArrays(3)); // [[1], [2, 2], [3, 3, 3]]
console.log(pyramidArrays(4)); // [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]
