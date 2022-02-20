'use strict';

function reverseSentence(string) {
  return string.split(' ').reverse().join(' ');
}

console.log(reverseSentence(''));                       // ""
console.log(reverseSentence('Hello World'));            // "World Hello"
console.log(reverseSentence('Reverse these words'));    // "words these Reverse"

function reverseWords(string) {
  let words = string.split(' ');

  words = words.map(word => {
    let length = word.length;

    if (length >= 5) {
      return word.split('').reverse().join('');
    } else {
      return word;
    }
  });

  return words.join(' ');
}

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"
