'use strict';

//the main process of encoding is as follows:
//take the string and spread it on the railfence
//since rail fence has three layers, we have to spread it on three lines
//this can be implemented with an array
//if the count reaches three, push in reverse direction
//if the count reaches  zero, push in the forward direction
//this can be implemented by using the value +1 or -1 depending on the direction
//
//Algorithm
//initialize an array with three sub arrays: [[], [], []]
//initialize a count to zero
//iterate through the characters of the string
//initialize adjust to 1 or -1 depending on whether the count is 3.
//by the end of the iteration, the array should be populated with the cipher text
//join the array, after flattening the array
//

function encodeRailFenceCipher(text) {
  text = text.replace(/\s/g, '');
  let arr = [[], [], []];

  let count = 0;
  let direction;

  [...text].forEach(char => {
    if (count === 0) {
      direction = true;
    }

    if (count === 2) {
      direction = false;
    }

    arr[count].push(char);

    let adjust = direction ? 1 : -1;

    count += adjust;
  });

  return arr.flat().join('');
}

console.log(encodeRailFenceCipher("WE ARE DISCOVERED FLEE AT ONCE"));

function lineSizesRailFence(text) {
  text = text.replace(/\s/g, '');
  let arr = [[], [], []];

  let count = 0;
  let direction;

  [...text].forEach(char => {
    if (count === 0) {
      direction = true;
    }

    if (count === 2) {
      direction = false;
    }

    arr[count].push(char);

    let adjust = direction ? 1 : -1;

    count += adjust;
  });

  return arr.map(subArr => subArr.length);
}

function cipherLines(text) {
  let linesLength = lineSizesRailFence(text);
  let startIdx = 0;

  return linesLength.map(length => {
    let lineStr = text.slice(startIdx, startIdx + length);
    startIdx += length;
    return lineStr;
  });
}

function decodeRailFenceCipher(text) {
  let lineStrings = cipherLines(text).map(str => [...str]);

  let decodedChars = [];
  let index = 0;
  let direction;

  while (lineStrings.some(arr => arr.some(String))) {
    let char = lineStrings[index].shift();

    decodedChars.push(char);

    if (index === 0) {
      direction = true;
    }

    if (index === 2) {
      direction = false;
    }

    let adjust = direction ? 1 : -1;
    index += adjust;
  }

  return decodedChars.join('');
}

console.log(decodeRailFenceCipher("WECRLTEERDSOEEFEAOCAIVDEN"));
