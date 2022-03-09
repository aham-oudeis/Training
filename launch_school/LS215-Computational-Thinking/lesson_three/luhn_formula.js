'use strict';

/*
 Input
  -a string of digits
  -might include non-digits characters
  -are all digits to be be converted to generate a checksum?

Output
  -true / false?
  -0 / 1?
  -'valid'/'invalid'

Examples:
-1111 ---> 2121
-2 + 1 + 2 + 1
-6

-8763 ---> 7733 (6--> 12--> 12 - 9--> 3; 8--> 16--> 16 - 9--> 7)
-7 + 7 + 3 + 3
-20

Algorithm
-first clean the string (replace(/\D/g))
-convert string to array of chars and reverse the array
-transform the array by doubling the number and substract 9
-if it is greater than 10 for all the even indexed numbers
-reduce the array with addition
-return a comparison between the (total % 10) and 0
 */

function isValidLuhn(string) {
  string = string.replace(/\D/g, '');

  let digits = [...string].reverse();

  const luhnConversion = (char, index) => {
    let num = Number(char);

    if (index % 2 === 1) {
      let double = num * 2;
      return double > 10 ? double - 9 : double;
    }

    return num;
  };

  let total = digits.map(luhnConversion)
                    .reduce((acc, item) => acc + item);

  return (total % 10) === 0;
}

function validLuhn(string) {
  if (isValidLuhn(string)) {
    return string;
  }

  for (let index = 0; index < 10; index++) {
    let newString = string + String(index);

    if (isValidLuhn(newString)) {
      return newString;
    }
  }
}

console.log(isValidLuhn('1111') === false);
console.log(isValidLuhn('8763') === true);
console.log(validLuhn('1111'));
