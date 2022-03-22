'use strict';

/*
Create a function that takes an array as an argument and return an array of the sum of each of its slices. An array's slices are groups of consecutive values that add up to a maximum of 100. No slice's total sum should exceed 100. However, if a single integer equals or exceeds 100, return the integer as well.

Examples

Approach:
-initialize an empty array to collect all the slices
-initialize a variable to track the sum of the slice
-iterate through the array and keep adding to the slice sum
-if the sum would exceed 100, then append the current slice sum to the collection
-and initialize the slice sum to the current element
-else, update the slice sum to the new value


sumOfSlices([10, 29, 13, 14, 15, 16, 17, 31, 20, 10, 29, 13, 14, 15, 16, 17, 31, 20, 100])
➞ [97, 78, 87, 68, 100]

// First slice: [10, 29, 13, 14, 15, 16]
// 10 + 29 + 13 + 14 + 15 + 16 = 97
// The next value could not be included in this slice because
// the total would exceed 100.

// Second slice: [17, 31, 20, 10]
// 17 + 31 + 20 + 10 = 78
// The next value could not be included in this slice because
// the total would exceed 100.

// And so on ...

sumOfSlices([58, 3, 38, 99, 10]) ➞ [99, 99, 10]

sumOfSlices([13]) ➞ [13]
*/

function sumOfSlices(arr) {
  let collection = [];
  let sliceSum = 0;

  arr.forEach(num => {
    let newSum = sliceSum + num;

    if (newSum > 100) {
      collection.push(sliceSum);
      sliceSum = num;
    } else {
      sliceSum = newSum;
    }
  });

  collection.push(sliceSum);

  return collection;
}

console.log(sumOfSlices([10, 29, 13, 14, 15, 16, 17, 31, 20, 10, 29, 13, 14, 15, 16, 17, 31, 20, 100])); // [97, 78, 87, 68, 100]

// First slice: [10, 29, 13, 14, 15, 16]
// 10 + 29 + 13 + 14 + 15 + 16 = 97
// The next value could not be included in this slice because
// the total would exceed 100.

// Second slice: [17, 31, 20, 10]
// 17 + 31 + 20 + 10 = 78
// The next value could not be included in this slice because
// the total would exceed 100.

// And so on ...

console.log(sumOfSlices([58, 3, 38, 99, 10])); // [99, 99, 10]

console.log(sumOfSlices([13])); // [13]
