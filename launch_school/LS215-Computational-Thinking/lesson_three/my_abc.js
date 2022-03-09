'use strict';

const BLOCKS =
  [ 'BO', 'XK', 'DQ', 'CP', 'NA',
    'GT', 'RE', 'FS', 'JW', 'HU',
    'VI', 'LY', 'ZM',
  ];

function isBlockWord(wordStr) {
  wordStr = wordStr.toUpperCase();

  let countBlockUse = {};

  for (let index = 0; index < wordStr.length; index++) {
    let char = wordStr[index];

    let blockItem = BLOCKS.find(block => block.includes(char));

    if (countBlockUse[blockItem]) {
      return false;
    }
    countBlockUse[blockItem] = 1;
  };

  return true;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
