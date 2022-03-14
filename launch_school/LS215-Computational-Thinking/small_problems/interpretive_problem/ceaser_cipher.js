'use strict';

function ceaserCipher(char, num) {
  let shiftBy = (num % 26);

  return String.fromCharCode(char.charCodeAt() + shiftBy);
}

console.log(ceaserCipher('A', 0));
console.log(ceaserCipher('A', 3));
console.log(ceaserCipher('y', 5));
console.log(ceaserCipher('a', 47));

