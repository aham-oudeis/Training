'use strict';

/*
What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

'abba' & 'abca' == false

Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']

anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']

anagrams('laser', ['lazing', 'lazy',  'lacer']) => []

Approach:
-create a letter count of the given word
-create a function that tests whether the letter count of a string is the same as the given one
-filter the array by using the check
*/

function anagrams(word, arr) {
  function countChar(string) {
    let count = {};

    [...string].forEach(char => {
      count[char] = count[char] || 0;
      count[char] += 1;
    });

    return count;
  }

  let count = countChar(word);

  function sameWordCount(str) {
    let charCount = countChar(str);

    for (let key in charCount) {
      if (count[key] !== charCount[key]) return false;
    }

    return true;
  }

  return arr.filter(sameWordCount);
}
