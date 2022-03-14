'use strict';

const CONVERSION = {
  zero: 0,
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
  six: 6,
  seven: 7,
  eight: 8,
  nine: 9,
};

function wordToDigit(string) {
  for (let key in CONVERSION) {
    let pattern = new RegExp(`\\b${key}\\b`, 'gi');
    string = string.replace(pattern, CONVERSION[key]);
  }

  return string;
}

function wordToDigit(string) {
  let pattern = /\b(zero|one|two|three|four|five|six|seven|eight|nine)\b/gi
  return string.replace(pattern, match => CONVERSION[match]);
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."
console.log(wordToDigit('Please call me when you are done. Thanks.'));
