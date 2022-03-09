'use strict';

function shorthand(inputString) {
  let allPartNumData = getAllPartNumData(inputString);

  let allNums = [];

  const extractRangeNums = ({ isUpperBound, partNumStr }) => {
    let lowerBound = allNums.slice(-1)[0] + 1 || 0;
    let numsToPush;

    if (isUpperBound) {
      numsToPush = generateRange(lowerBound, partNumStr);
    } else if (Number(partNumStr) < lowerBound) {
      numsToPush = [higherNumber(lowerBound, partNumStr)];
    } else {
      numsToPush = [Number(partNumStr)];
    }

    allNums.push(...numsToPush);
  };

  allPartNumData.forEach(extractRangeNums);

  return allNums;
}

// Get all partial number data
function getAllPartNumData(string) {
  let listOfRangeStrs = string.match(/(?:, |-|\.\.|:)?\d+/g);

  return listOfRangeStrs.map(partNumStr => {
    return {
      isUpperBound: /-|\.\.|:/.test(partNumStr),
      partNumStr: partNumStr.match(/\d+/)[0],
    };
  });
}

function isValidNum(currentNum, partNumStr) {
  return String(currentNum).slice(-partNumStr.length) === partNumStr;
}

function generateRange(lowerBound, partNumStr) {
  let numbers = [];

  while (!isValidNum(lowerBound, partNumStr)) {
    numbers.push(lowerBound);
    lowerBound += 1;
  }

  numbers.push(lowerBound);

  return numbers;
}

function higherNumber(lowerBound, partNumStr) {
  while (!isValidNum(lowerBound, partNumStr)) {
    lowerBound += 1;
  }

  return lowerBound;
}
console.log(shorthand("1, 3, 7, 2, 4, 1")); // --> 1, 3, 7, 12, 14, 21
console.log(shorthand("1-3, 1-2")); // --> 1, 2, 3, 11, 12
console.log(shorthand("1:5:2")); // --> 1, 2, 3, 4, 5, 6, ... 12
console.log(shorthand("104-2")); // --> 104, 105, ... 112
console.log(shorthand("104-02")); // --> 104, 105, ... 202
console.log(shorthand("545, 64..11")); // --> 545, 564, 565, .. 611
console.log(shorthand("0, 3")); // --> 0, 3
console.log(shorthand("0-3")); // --> 0, 1, 2, 3
