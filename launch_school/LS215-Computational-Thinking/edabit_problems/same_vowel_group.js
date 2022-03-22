'use strict';

/*
Write a function that selects all words that have all the same vowels (in any order and/or number) as the first word, including the first word.
Examples

sameVowelGroup(["toe", "ocelot", "maniac"]) ➞ ["toe", "ocelot"]

sameVowelGroup(["many", "carriage", "emit", "apricot", "animal"]) ➞ ["many"]

sameVowelGroup(["hoops", "chuff", "bot", "bottom"]) ➞ ["hoops", "bot", "bot

Approach:
-write a function that extracts only the vowels from a word
-sort the array of vowels and join it as a string

*/

function extractVowels(string) {
  let vowels = {};

  [...string].forEach(char => {
    if (/[aeiou]/.test(char)) vowels[char] = true;
  });

  return Object.keys(vowels)
               .sort()
               .join('');
}

function sameVowelGroup(arr) {
  let firstWord = arr[0];
  let stringOfVowels = extractVowels(firstWord);

  const sameVowels = (word) => {
    return extractVowels(word) === stringOfVowels
  };

  return arr.filter(sameVowels);
}

console.log(sameVowelGroup(["toe", "ocelot", "maniac"]));// ["toe", "ocelot"]

console.log(sameVowelGroup(["many", "carriage", "emit", "apricot", "animal"]));// ["many"]

console.log(sameVowelGroup(["hoops", "chuff", "bot", "bottom"]));// ["hoops", "bot", "bottom']
