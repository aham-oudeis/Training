'use strict';

function caesarCipher(char, num) {
  let LETTER_A = 'a'.charCodeAt();
  let alphabets = 'abcdefghijklmnopqrstuvwxyz';

  let charPosition = char.toLowerCase().charCodeAt() - LETTER_A;
  let shiftedCharPosition = (charPosition + num) % 26;
  let encodedChar = alphabets[shiftedCharPosition];

  return /[A-Z]/.test(char) ? encodedChar.toUpperCase() : encodedChar;
}

function caesarEncrypt(string, num) {
  const encrypt = char => {
    if (/[^a-zA-Z]/.test(char)) return char;
    return caesarCipher(char, num);
  };

  return [...string].map(encrypt).join('');
}

console.log(caesarCipher('A', 0));
console.log(caesarCipher('A', 3));
console.log(caesarCipher('y', 5));
console.log(caesarCipher('a', 47));
// simple shift
console.log(caesarEncrypt('A', 0));       // "A"
console.log(caesarEncrypt('A', 3));       // "D"

// wrap around
console.log(caesarEncrypt('y', 5));       // "d"
console.log(caesarEncrypt('a', 47));      // "v"

// all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?); Wrong?', 2));
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"

