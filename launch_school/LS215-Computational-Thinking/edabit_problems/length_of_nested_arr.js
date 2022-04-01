'use strict';

/*

The .length property on an array will return the number of elements in the array. For example, the array below contains 2 elements:

[1, [2, 3]]
// 2 elements, number 1 and array [2, 3]

Suppose we instead wanted to know the total number of non-nested items in the nested array. In the above case, [1, [2, 3]] contains 3 non-nested items, 1, 2 and 3.

Write a function that returns the total number of non-nested items in a nested array.
Examples

getLength([1, [2, 3]]) ➞ 3

getLength([1, [2, [3, 4]]]) ➞ 4

getLength([1, [2, [3, [4, [5, 6]]]]]) ➞ 6

getLength([1, [2], 1, [2], 1]) ➞ 5

Input: arrays containing nested arrays
Output: total number of elements in the whole array, including all the nested ones

Rules:
-find all the nested arrays and count their elements recursively


Examples:
[1, [2, [3, [4, [5, 6]]]]]
=> 1 + f(1 + f(1 + f(1 + f(2)))

[1, [2, 2], 1, [2], 1]
=> 1 + f([2, 2]) + 1 + f([2]) + 1
=> 1 + 2 + 1 + 1 + 1 + 1

[1, [2, [3, [4, [5, 6, [7, 8]]]]], [9, 10]]
=> 1 + f(1 + f(...)) + f([9, 10])

Data Structures
-arrays

Strategy
-if there is no further array nested inside, return the length of the array
-add to the count and slice the array and pass it to the function

[1, [2, 2], 1, [2], 1]

[1, 2, 3] => reduce it to three by iterating

Pseudocode:
-reduce the array by incrementing the value everytime, it encounters an element that is not an array
-if it encounters an array, call the same function and add the value to the accumulator
*/

function getLength(arr) {
  return array.reduce((acc, el) => {
    if (!Array.isArray(el)) {
      return acc + 1;
    } else {
      return acc + getLength(el);
    }
  }, 0);
}

function getLength(array) {
  return array.reduce((acc, el) => {
    return !Array.isArray(el) ? acc + 1 : acc + getLength(el);
  }, 0);
}

console.log(getLength([1, 2, 3]));// 3
console.log(getLength([1, [2, 3]]));// 3

console.log(getLength([1, [2, [3, 4]]]));// 4

console.log(getLength([1, [2, [3, [4, [5, 6]]]]]));// 6

console.log(getLength([1, [2], 1, [2], 1]));// 5



