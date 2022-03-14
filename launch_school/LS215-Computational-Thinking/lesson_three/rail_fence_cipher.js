'use strict';

//the main process of encoding is as follows:
//take the string and spread it on the railfence
//since rail fence has three layers, we have to spread it on three lines
//this can be implemented with an array
//if the count reaches three, push in reverse forward
//if the count reaches  zero, push in the forward forward
//this can be implemented by using the value +1 or -1 depending on the forward
//
//Algorithm
//initialize an array with three sub arrays: [[], [], []]
//initialize a count to zero
//iterate through the characters of the string
//initialize adjust to 1 or -1 depending on whether the count is 3.
//by the end of the iteration, the array should be populated with the cipher text
//join the array, after flattening the array
//
function removeSpaces(text) {
  return text.replace(/\s/g, '');
}

function nestedArrOfSize(num) {
  let arr = [];

  for (let i = 1; i <= num; i++) {
    arr.push([]);
  }

  return arr;
}

function fillZigZag(text, arr, numOfRails) {
  let count = 0;
  const lastIdx = numOfRails - 1;
  let forward;

  [...text].forEach(char => {
    if (count === 0) {
      forward = true;
    }

    if (count === lastIdx) {
      forward = false;
    }

    arr[count].push(char);

    let adjust = forward ? 1 : -1;

    count += adjust;
  });

  return arr;
}

function encodeRailFenceCipher(text, numOfRails = 3) {
  text = removeSpaces(text);
  let arr = nestedArrOfSize(numOfRails);

  arr = fillZigZag(text, arr, numOfRails);

  return arr.flat().join('');
}

function lineSizesRailFence(text, numOfRails = 3) {
  text = removeSpaces(text);
  let arr = nestedArrOfSize(numOfRails)

  arr = fillZigZag(text, arr, numOfRails);

  return arr.map(subArr => subArr.length);
}

function cipherLines(text, numOfRails) {
  let linesLength = lineSizesRailFence(text, numOfRails);
  let startIdx = 0;

  return linesLength.map(length => {
    let lineStr = text.slice(startIdx, startIdx + length);
    startIdx += length;
    return lineStr;
  });
}

function extractZigZag(lines, numOfRails) {
  const lastIdx = numOfRails - 1;
  const linesAreNonEmpty = () => lines.some(arr => arr.some(String));

  let decodedChars = [];
  let index = 0;
  let forward;

  while (linesAreNonEmpty()) {
    let char = lines[index].shift();

    decodedChars.push(char);

    if (index === 0) {
      forward = true;
    }

    if (index === lastIdx) {
      forward = false;
    }

    let adjust = forward ? 1 : -1;
    index += adjust;
  }

  return decodedChars;
}

function decodeRailFenceCipher(text, numOfRails = 3) {
  let arrOfLines = cipherLines(text, numOfRails).map(str => [...str]);
  let decodedChars = extractZigZag(arrOfLines, numOfRails);

  return decodedChars.join('');
}

console.log(encodeRailFenceCipher("WE ARE DISCOVERED FLEE AT ONCE", 4));
console.log(decodeRailFenceCipher("WIREEEDSEEEACAECVDLTNROFO", 4));
