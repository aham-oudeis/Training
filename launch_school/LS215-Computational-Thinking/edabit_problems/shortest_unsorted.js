'use strict';
/*
Given an integer array, you need to find the shortest continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order, too.

Create a function that returns the length of that subarray.

Input: array
Output: integer count

Approach
- find the index of the element that has a lower number to the right
  -- iterate through the indices starting at 0
  -- slice the array to the right of the index
  -- check if the current element is > than any of the rest
- find the index of the element that has a higher number to the left
  -- iterate through the indices starting at the last index
  -- slice the array up to the index
- return second - first + 1

findUnsortedSubarray([1, 3, 2, 5, 8, 7, 13]) ➞ 5
// You need to sort [3, 2, 5, 8, 7] in ascending order to make
// the whole array sorted in ascending order.

findUnsortedSubarray([10, 7, 5, 3]) ➞ 4

findUnsortedSubarray([2, 4, 4, 4, 4, 3]) ➞ 5


function greaterThanLeft(arr) {
  for (let idx = 0; idx < arr.length; idx++) {
    let subarrToRight = arr.slice(idx + 1);
    if (subarrToRight.some(el => el < arr[idx])) {
      return idx;
    }
  }
}

function smallerThanRight(arr) {
  for (let idx = arr.length - 1; idx >= 0; idx--) {
    let subarrToLeft = arr.slice(0, idx);
    if (subarrToLeft.some(el => el > arr[idx])) {
      return idx;
    }
  }
}

findUnsortedSubarray([2, 4, 4, 4, 4, 3])
*/
function greaterThanLeft(arr) {
  let lowestElement = arr[arr.length - 1];
  let idxOfUnsortedItem;

  for (let idx = arr.length - 2; idx >= 0; idx--) {
    if (arr[idx] > lowestElement) {
      idxOfUnsortedItem = idx;
    }

    if (arr[idx] < lowestElement) {
      lowestElement = arr[idx];
    }
  }

  return idxOfUnsortedItem;
}

// findUnsortedSubarray([2, 4, 4, 4, 4, 3])
function smallerThanRight(arr) {
  let highestElement = arr[0];
  let idxOfUnsortedItem;

  for (let idx = 1; idx < arr.length; idx++) {
    if (arr[idx] < highestElement) {
      idxOfUnsortedItem = idx;
    }

    if (arr[idx] > highestElement) {
      highestElement = arr[idx];
    }
  }

  return idxOfUnsortedItem;
}

function findUnsortedSubarray(arr) {
  let leftIdxOfUnsorted = greaterThanLeft(arr);
  let rightIdxOfUnsorted = smallerThanRight(arr);

  if (leftIdxOfUnsorted === undefined) return 0;

  return rightIdxOfUnsorted - leftIdxOfUnsorted + 1;
}

console.log(findUnsortedSubarray([1, 3, 2, 5, 8, 7, 13]));
// You need to sort [3, 2, 5, 8, 7] in ascending order to make
// the whole array sorted in ascending order.

console.log(findUnsortedSubarray([10, 7, 5, 3]) === 4);

console.log(findUnsortedSubarray([2, 4, 4, 4, 4, 3]) === 5);
console.log(findUnsortedSubarray([1, 2, 3, 3]) === 0);
