'use strict';

/*
Create a moreZeros function which will receive a string for input, and return an array (or null terminated string in C) containing only the characters from that string whose binary representation of its ASCII value consists of more zeros than ones.

You should remove any duplicate characters, keeping the first occurence of any such duplicates, so they are in the same order in the final array as they first appeared in the input string.

Examples

'abcde' === ["1100001", "1100010", "1100011", "1100100", "1100101"]
               True       True       False      True       False

        --> ['a','b','d']

'DIGEST'--> ['D','I','E','T']

Approach
-convert the string into chars
-filter the char by checking the test of the char
  --convert the char to its charcode
  --then to its binary
  --match the 1 and the zeros
  --return the comparison of zeros greater than 1
*/

function moreZeros(string) {
  const hasMoreZeros = (char) => {
    let binaryStr = char.charCodeAt().toString(2);
    let zeros = (binaryStr.match(/0/g) || []).length;
    let ones = binaryStr.length - zeros;

    return zeros > ones;
  };

  return [...new Set(string)].filter(hasMoreZeros);
}

console.log(moreZeros('DIGEST'));
