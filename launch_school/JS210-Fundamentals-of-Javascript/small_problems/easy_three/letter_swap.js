'use strict';

function swap(string) {
  let words = string.split(' ');

  let swappedWords = words.map(element => {
    let chars = element.split('');
    let firstChar = chars[0];
    let lastChar = chars[chars.length - 1];

    [chars[0], chars[chars.length - 1]] = [lastChar, firstChar];

    return chars.join('');
  });

  return swappedWords.join(' ');
}

swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
swap('Abcde');                          // "ebcdA"
swap('a');                              // "a"
