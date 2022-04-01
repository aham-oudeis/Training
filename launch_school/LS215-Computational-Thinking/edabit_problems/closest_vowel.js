'use strict';

/*
Write a function that takes in a string and for each character, returns the distance to the nearest vowel in the string. If the character is a vowel itself, return 0.
Examples

distanceToNearestVowel("aaaaa") ➞ [0, 0, 0, 0, 0]

distanceToNearestVowel("babbb") ➞ [1, 0, 1, 2, 3]

distanceToNearestVowel("abcdabcd") ➞ [0, 1, 2, 1, 0, 1, 2, 3]

distanceToNearestVowel("shopper") ➞ [2, 1, 0, 1, 1, 0, 1]


                        Problem
--------------------------------------------------------------
Input: string
Output: array of numbers such that each number represent the closest distance between the char and the vowel

Rules:
-the distance is zero if the char is itself a vowel
-the vowel could be located either on the left or on the right

                      Clarifications:
--------------------------------------------------------------
Bad Inputs: what if an array is passed in?
Edge Cases: an empty string, spaces, non-alphabetic chars

                        Examples
--------------------------------------------------------------
distanceToNearestVowel("babbb") ➞ [1, 0, 1, 2, 3]


                        Data Structure
--------------------------------------------------------------
arrays: containing indices of the vowels

                        Algorithm
--------------------------------------------------------------
-a function that takes in a number and returns the number closest to it from the array containing indices of the vowels
  --initialize the value to be infinity
  --iterate through the indices and find the index that yields the lowest difference
  --return the lowest index value

--iterate through the characters and map each character by passing its index to the helper function
*/

function vowelIndices(string) {
  let indexOfVowels = [];

  [...string].forEach((char, idx )=> {
    if (/[aeiou]/.test(char)) {
      indexOfVowels.push(idx);
    }
  });

  return indexOfVowels;
}

function distanceToNearestVowel(string) {
  let indexOfVowels = vowelIndices(string);

  if (indexOfVowels.length === 0) return [];

  function smallestDiff(index) {
    let diff = Infinity;

    indexOfVowels.forEach(num => {
      if (Math.abs(num - index) < diff) {
        diff = Math.abs(num - index);
      }
    });

    return diff;
  }

  return [...string].map((char, idx) => {
    if (/[aeiou]/i.test(char)) return 0;
    return smallestDiff(idx)
  });
}

console.log(distanceToNearestVowel("babbb"));// [1, 0, 1, 2, 3]
