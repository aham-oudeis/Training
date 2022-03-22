'use strict';

/*

Starting time: 12: 18;
Time taken: 23 minutes

Given two arrays small arr and big arr, we say small arr is an ordered subarray of big arr if all the elements of small arr can be found in big arr, and in the same order.

Examples:

    [4, 3, 2] is an ordered subarray of [5, 4, 3, 2, 1].
    [5, 3, 1] is an ordered subarray of [5, 4, 3, 2, 1].
    [5, 3, 1] is not and ordered subarray of [1, 2, 3, 4, 5] since elements are not in the same - [1, 2, 3] is an ordered subarray of [3, 2, 1, 2, 3].

Write a function that, given arrays smarr and bigarr, decides if smarr is an ordered subarray of bigarr.
Examples

isOrdSub([4, 3, 2], [5, 4, 3, 2, 1]) ➞ true

isOrdSub([5, 3, 1], [5, 4, 3, 2, 1]) ➞ true

isOrdSub([5, 3, 1], [1, 2, 3, 4, 5]) ➞ false

isOrdSub([1, 2, 3], [3, 2, 1, 2, 3]) ➞ true

Input: two arrays
Output: a boolean

Clarifications:
-empty array? N/a
-small and big proper order
-NaN? N/a
-bad inputs: n/a

Approach:
-convert the first array into a regex
  --joining the elements with '.*'
  --convert that into regex
-convert the second array into a string
-test the regex with string


isOrdSub([4, 3, 2], [5, 4, 3, 2, 1]) ➞ true

isOrdSub([5, 3, 1], [5, 4, 3, 2, 1]) ➞ true

isOrdSub([5, 3, 1], [1, 2, 3, 4, 5]) ➞ false

isOrdSub([1, 2, 3], [3, 2, 1, 2, 3]) ➞ true

*/

function isOrdSub(small, big) {
  let pattern = RegExp(small.join('.*'));
  let strBigArr = big.join('');

  return pattern.test(strBigArr);
}

console.log(isOrdSub([4, 3, 2], [5, 4, 3, 2, 1]) == true);

console.log(isOrdSub([5, 3, 1], [5, 4, 3, 2, 1]) == true);

console.log(isOrdSub([5, 3, 1], [1, 2, 3, 4, 5]) == false);

console.log(isOrdSub([1, 2, 3], [3, 2, 1, 2, 3]) == true)
