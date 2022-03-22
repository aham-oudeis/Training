'use strict';

/*
Create a function that takes in an array of numbers or strings and returns an array with the items from the original array stored in subarrays. Items of the same value should be in the same subarray.
Examples

advancedSort([2, 1, 2, 1]) ➞ [[2, 2], [1, 1]]

advancedSort([5, 4, 5, 5, 4, 3]) ➞ [[5, 5, 5], [4, 4], [3]]

advancedSort(["b", "a", "b", "a", "c"]) ➞ [["b", "b"], ["a", "a"], ["c"]]

Approach:
-iterate through the array and create a count obj
-on each additional count push the element to the value
-collect the values of the count obj
*/

function advancedSort(arr) {
  let seen = {};
  let collection = [];

  arr.forEach(item => {
    if (seen[item] !== undefined) {
      let idxOfItem = seen[item];
      collection[idxOfItem].push(item);
    } else {
      seen[item] = collection.length;
      collection.push([item]);
    }
  });

  return collection;
}

console.log(advancedSort([2, 1, 2, 1]));// [[2, 2], [1, 1]]

console.log(advancedSort([5, 4, 5, 5, 4, 3]));// [[5, 5, 5], [4, 4], [3]]

console.log(advancedSort(["b", "a", "b", "a", "c"]));// [["b", "b"], ["a", "a"], ["c"]]
