'use strict';
//problem: extract range from a string with range in shortform
//where only the significant part of the latter number is mentioned

function generateRange(lower, higher) {
  let coll = [];
  let num = lower;

  while (num <= higher) {
    coll.push(num);
    num += 1;
  }

  return coll;
}

function findHigher(lower, significantPart) {
  let higherNum = Number(lower);

  const foundHigherNum = () => {
    return String(higherNum).endsWith(significantPart);
  };

  while (!foundHigherNum()) {
    higherNum += 1;
  }

  return higherNum;
}

function stringToRange(rangeString) {
  let range = rangeString.split(/,\s+/);
  let chunkOfRange = range.map(str => str.split(/[:-]|[.]{2}/));

  //initialize a variable lowerBound  to keep track of
  //the lower bound for finding the correct range number
  let lowerBound = chunkOfRange[0][0];

  const insertProperRange = (subArr) => {
    return subArr.map(digitStr => {
      if (Number(digitStr) >= Number(lowerBound)) {
        lowerBound = digitStr;
        return Number(digitStr);
      }

      let nextNum = findHigher(lowerBound, digitStr);
      lowerBound = String(nextNum);
      return nextNum;
    });
  };

  return chunkOfRange.map(insertProperRange);
}

function extractRange(rangeString) {
  const expandRange = (range) => {
    let first = range[0];
    let last = range[range.length - 1];

    return generateRange(first, last);
  };

  return stringToRange(rangeString).flatMap(expandRange);
}

console.log(extractRange("1, 3, 7, 2, 4, 1"));
console.log(extractRange("1-3, 1-2"));
console.log(extractRange("1:5:2"));
console.log(extractRange("104-2"));
console.log(extractRange("104-02"));
console.log(extractRange("545, 64:11" ));
