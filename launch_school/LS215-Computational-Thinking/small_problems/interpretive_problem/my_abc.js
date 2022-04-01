'use stric';

/*
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

Approach:
-create an array of string with the word pairs
-iterate through the given string
-for each character determine the index of the string that contains the character
-reassign that index to an empty string
-if the index is -1, then return false
-if the iteration is complete return true

*/

function isBlockWord(word) {
  word = word.toUpperCase();

  let blocks = [
    'BO', 'X:K', 'DQ', 'CP', 'NA',
    'GT', 'RE', 'FS', 'JW', 'HU',
    'VI', 'LY', 'ZM'
  ];

  for (let idx = 0; idx < word.length; idx++) {
    let char = word[idx];
    let position = blocks.findIndex(item => item.includes(char));
    if (position === -1) return false;
    blocks[position] = '';
  }

  return true;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord(''));       // true
