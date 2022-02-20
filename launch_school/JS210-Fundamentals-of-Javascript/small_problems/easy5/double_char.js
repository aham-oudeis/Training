'use strict';

let repeater = function (string) {
  return string.split('').map(char => char.repeat(2)).join('');
};

console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""
//

let doubleConsonants = function (string) {
  const doubleOnlyConsonant =  (char) => {
    if (/[AEIOUaeiou]/.test(char)) {
      return char;
    } else if (/[A-Za-z]/.test(char)) {
      return char.repeat(2);
    } else {
      return char;
    }
  };

  return [...string].map(doubleOnlyConsonant).join('');
};

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""
