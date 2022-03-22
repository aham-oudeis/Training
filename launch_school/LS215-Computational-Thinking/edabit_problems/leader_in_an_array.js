'use strict';

/*
Create a function that finds each number in the given array that is greater than every number that comes after it. Your solution should return an array of the number(s) that meet these criteria.

Input: array
Output: subarray

Approach:
-select elements by checking if the elements to the right are all smaller
-even the same value would not do

- is there a simpler approach?

-reverse the array
-append elements by checking if the previous element is smaller
-return the collection by reversing it
leader([2, 3, 20, 15, 8, 3]) ➞ [20, 15, 8, 3]
// Note that 20 is greater than all the elements to it's
// right side, similarly 15 and so on.

leader([2, 3, 20, 15, 8, 25, 3]) ➞ [25, 3]
// Note that 20 cannot be added because it is not greater than 25.

leader([1, 2, 3, 4, 5]) ➞ [5]
// 5 is technically greater than the (zero) remaining items.

leader([8, 7, 1, 2, 10, 3, 5]) ➞[10, 5]
// 10 is greater than all items to the right of it, so include.
// 3 is not greater than all items to the right of it, so exclude.
// 5 is greater than the remaining items, so include.

function leader(arr) {
  return arr.filter((num, idx) => {
    return arr.slice(idx + 1).every(el => num > el);
  });
}
*/

function leader(arr) {
  let arrReverse = arr.reverse();
  let collection = [];
  let lastNum = -Infinity;

  arrReverse.forEach(num => {
    if (num > lastNum) {
      lastNum = num;
      collection.push(num);
    }
  });

  return collection.reverse();
}

console.log(leader([2, 3, 20, 15, 8, 3]));// [20, 15, 8, 3])
// Note that 20 is greater than all the elements to it's
// right side, similarly 15 and so on.

console.log(leader([2, 3, 20, 15, 8, 25, 3])); [25, 3]
// Note that 20 cannot be added because it is not greater than 25.

console.log(leader([1, 2, 3, 4, 5])); //[5]
// 5 is technically greater than the (zero) remaining items.

console.log(leader([8, 7, 1, 2, 10, 3, 5])); //[10, 5]
// 10 is greater than all items to the right of it, so include.
// 3 is not greater than all items to the right of it, so exclude.
// 5 is greater than the remaining items, so include.
