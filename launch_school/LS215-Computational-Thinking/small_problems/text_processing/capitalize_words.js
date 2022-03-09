'use strict';

function wordCap(sentence) {
  const capitalize = function (word) {
    let chars = [...word];
    chars[0] = chars[0].toUpperCase();
    return chars.join('');
  }

  return sentence.split(' ').map(capitalize).join(' ');
}

console.log(wordCap('four score and seven'));       // "Four Score And Seven"
console.log(wordCap('the javaScript language'));    // "The Javascript Language"
console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'
