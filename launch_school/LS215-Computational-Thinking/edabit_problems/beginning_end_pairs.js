'use strict';

/*
Write a function that pairs the first number in an array with the last, the second number with the second to last, etc.
Examples

pairs([1, 2, 3, 4, 5, 6, 7]) ➞ [[1, 7], [2, 6], [3, 5], [4, 4]]
[1, 2, 3, 4, 5, 6, 7]
 0  1  2  3  4  5  6
 0  1  2  3  2  1  0

 half = 6 / 2 = 3;

pairs([1, 2, 3, 4, 5, 6]) ➞ [[1, 6], [2, 5], [3, 4]]

[1, 2, 3, 4, 5, 6]
 0  1  2  3  4  5
 0  1  2  2  1  0

 half = 5 / 2 = 2.5;

pairs([5, 9, 8, 1, 2]) ➞ [[5, 2], [9, 1], [8, 8]]

pairs([]) ➞ []
*/

function pairs(arr) {
  let lastIdx = arr.length - 1;
  let half = Math.floor(lastIdx / 2);
  let collection = [];

  for (let idx = 0; idx <= half; idx++) {
    collection.push([arr[idx], arr[lastIdx - idx]])
  }

  return collection;
}

console.log(pairs([1, 2, 3, 4, 5, 6, 7]));// [[1, 7], [2, 6], [3, 5], [4, 4]]

console.log(pairs([1, 2, 3, 4, 5, 6]));// [[1, 6], [2, 5], [3, 4]]

console.log(pairs([5, 9, 8, 1, 2]));// [[5, 2], [9, 1], [8, 8]]

console.log(pairs([]));// []
