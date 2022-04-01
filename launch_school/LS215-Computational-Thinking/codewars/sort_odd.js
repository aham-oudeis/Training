'use strict';

/*
Task

You will be given an array of numbers. You have to sort the odd numbers in ascending order while leaving the even numbers at their original positions.
Examples

[7, 1]  =>  [1, 7]
[5, 8, 6, 3, 4]  =>  [3, 8, 6, 5, 4]
[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]  =>  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]

Strategy
-select the odd
-select the even
-sort the odd in descending order
-reverse the even
-iterate through the given array and collect the elements:
  -if the element is even pop from the even
  -if the element is odd pop from the odd
-return the collection
*/

function sortOdd(nums) {
  let odd = nums.filter(num => num % 2 === 1);
  odd.sort((a, b) => b - a);

  return nums.map(num => {
    return num % 2 === 0 ? num : odd.pop();
  });
}

console.log(sortOdd([9, 8, 7, 6, 5, 4, 3, 2, 1, 0]));
