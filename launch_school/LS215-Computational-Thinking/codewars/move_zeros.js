'use strict';

/*
Write an algorithm that takes an array and moves all of the zeros
to the end, preserving the order of the other elements.

input: array
output: array with zeros moved to the end

approach:
-iterate through the array and delete the zeros
-keep the count of the deleted zeros
-add that many zeros to the end

a better approach:
-iterate through the array and append elements to a new array
-if the element is a zero append it to another array
-concat the two arrays

even better approach:
-filter nonZeros
-filter zeros
-concatanate the two
*/

function moveZeros(arr) {
  const nonZeros = item => item !== 0;
  const zeros = item => item === 0;

  return arr.filter(nonZeros).concat(arr.filter(zeros));
}

console.log(moveZeros([1,2,0,1,0,1,0,3,0,1]));
