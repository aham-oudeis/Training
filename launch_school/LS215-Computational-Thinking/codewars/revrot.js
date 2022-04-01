'use strict';

/*
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size `sz`).
If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.

If:
`sz` is <= `0` or if `str` is empty return `""`
`sz` is greater (>) than the length of str it is impossible to take a chunk of size sz hence return `""`


                        Problem
--------------------------------------------------------------
Input: a string containing digits and a number
Output: a string

Rules:
-if number is less than or equal to 0 or greater than the length of the string, return ''.
-slice the string into chunks of the given number
-if the sum of the cubes of its digits is an even number, then reverse that chunk
-else, rotate that chunk to the left
-put together all the  chunks and return it as a string

                      Clarifications:
--------------------------------------------------------------
Bad Inputs: n/a
Edge Cases: what if the chunk size leaves some string out?
-discard the chunks if they are not of that given chunk size
-empty string returns empty string

'12345', 2 => '12', '34', '5'

                        Examples
--------------------------------------------------------------


                        Data Structure
--------------------------------------------------------------
arrays

                        Algorithm
--------------------------------------------------------------
-rotate a string
  --take the first element
  --slice the rest of the string
  --concatanate the rest and the first
-reverse a string
  --reverse the characters of the string and join again
-check if the string of digits passes the test: cubes of the digits total to an even number
  --map the digits to their cubes after converting them to numbers
  --take the sum and check if it is divisible by 2
-slicing
  --iterate through the characters and keep a running chunk
  --apend the character to the chunk
  --if the chunk is of the size given, then append it to the collection; reassign the chunk to an empty string

-slice the string
-create an array of chunks
-map the chunk acccording to the rule: if it passes the check, reverse it; else, rotate it
-join the chunks and return the string
*/

function rotate(string) {
  return string.slice(1) + string[0];
}

function reverse(string) {
  return [...string].reverse().join('');
}

function checkDigits(string) {
  const total = (a, b) => a + b;
  const cubes = (num) => {
    return Number(num) ** 3;
  };

  let digits = [...string].map(cubes);

  return digits.reduce(total, 0) % 2 === 0;
}

function slice(string, size) {
  let collection = [];
  let chunk = '';

  [...string].forEach(digit => {
    chunk += digit;

    if (chunk.length === size) {
      collection.push(chunk);
      chunk = '';
    }
  });

  return collection;
}

function revrot(string, size) {
  let len = string.length;
  if (len <= 0 || len < size) return '';

  let chunks = slice(string, size);

  const revOrRot = (str) => {
    if (checkDigits(str)) {
      return reverse(str);
    } else {
      return rotate(str);
    }
  };

  return chunks.map(revOrRot).join('');
}

console.log(revrot("1234", 0) === "");
console.log(revrot("", 0) === "");
console.log(revrot("1234", 5) === "");
console.log(revrot("733049910872815764", 5) === "330479108928157");
console.log(revrot("123456987654", 6) === "234561876549");
console.log(revrot("123456987653", 6) === "234561356789");
console.log(revrot("66443875", 4) === "44668753");
console.log(revrot("66443875", 8) === "64438756");
console.log(revrot("664438769", 8) === "67834466");
console.log(revrot("123456779", 8) === "23456771");
console.log(revrot("", 8) === "");
console.log(revrot("123456779", 0) === "");
console.log(revrot("563000655734469485", 4) === "0365065073456944");
