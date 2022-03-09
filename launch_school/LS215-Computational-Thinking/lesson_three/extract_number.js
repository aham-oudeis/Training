'use strict';

/*
 -Input: a string with digits, spaces, dashes, brackets
  clarifications:
  -can there be an empty string?
  -what to do if the string contains other characters?
 -Output:a string

 PseudoCode:
 -replace all non-digits with an empty string
 -check if the remaining string matches: /([0-9]?)([0-9]{10})/
 -if match[1] === '1' || match[1] === '', then extract match[2];
 */

function extractNumber(string) {
  string = string.replace(/[^0-9]/g, '');
  let match = string.match(/^[1]?([0-9]{10})$/);

  if (match) {
    return match[1];
  } else {
    return '0'.repeat(10);
  }
}


console.log(extractNumber('12') === '0'.repeat(10));
console.log(extractNumber('122736') === '0'.repeat(10));
console.log(extractNumber('1234567890') === '1234567890');
console.log(extractNumber('11234567890') === '1234567890');
console.log(extractNumber('2234567890') === '2234567890');
console.log(extractNumber('123-456-7890') === '1234567890');
console.log(extractNumber('(123)4567890') === '1234567890');
console.log(extractNumber('123.456.7890') === '1234567890');
console.log(extractNumber('(123)-4567-890') === '1234567890');
console.log(extractNumber('1234567890973') === '0'.repeat(10));
