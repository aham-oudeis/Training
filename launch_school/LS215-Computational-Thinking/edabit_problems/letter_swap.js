'use strict';

/*
Given an array of strings and an original string, write a function to output an array of boolean values - true if the word can be formed from the original word by swapping two letters only once and false otherwise.
Examples

validateSwaps(["BACDE", "EBCDA", "BCDEA", "ACBED"], "ABCDE")
➞ [true, true, false, false]

// Swap "A" and "B" from "ABCDE" to get "BACDE".
// Swap "A" and "E" from "ABCDE" to get "EBCDA".
// Both "BCDEA" and "ACBED" cannot be formed from "ABCDE" using only a single swap.

validateSwaps(["32145", "12354", "15342", "12543"], "12345")
➞ [true, true, true, true]

validateSwaps(["9786", "9788", "97865", "7689"], "9768")
➞ [true, false, false, false]

Approach:
-create a function that checks if the difference in index positions between two strings is the same
  --create an index positions object for the given string
  --for each letter count the number of dissimilar index positions
-pass a string and the index position obj
-do the same for each of the strings in the array

*/

function indexofLetters(string) {
  let indexes = {};
  [...string].forEach((char, idx) => indexes[char] = idx);

  return indexes;
}

function indexDiffTwo(string, indexes) {
  let count = 0;
  let indexesOfSample = indexofLetters(string);

  if (string.length !== Object.keys(indexes).length) return false;

  [...string].forEach(char => {
    if (indexesOfSample[char] !== indexes[char]) count += 1;
  });

  return count === 2;
}

function validateSwaps(arr, str) {
  let indexes = indexofLetters(str);
  const checkSwap = (text) => indexDiffTwo(text, indexes);
  return arr.map(checkSwap);
}

console.log(validateSwaps(["BACDE", "EBCDA", "BCDEA", "ACBED"], "ABCDE"));// [true, true, false, false]

// Swap "A" and "B" from "ABCDE" to get "BACDE".
// Swap "A" and "E" from "ABCDE" to get "EBCDA".
// Both "BCDEA" and "ACBED" cannot be formed from "ABCDE" using only a single swap.

console.log(validateSwaps(["32145", "12354", "15342", "12543"], "12345"));// [true, true, true, true]

console.log(validateSwaps(["9786", "9788", "97865", "7689"], "9768"));// [true, false, false, false]

