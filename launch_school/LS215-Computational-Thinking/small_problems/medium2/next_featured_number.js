'use strict';

function uniqDigits(num) {
  let digitSeen = {};
  let digits = [...String(num)];

  for (let i = 0; i < digits.length; i++) {
    if (digitSeen[digits[i]]) {
      return false;
    }

    digitSeen[digits[i]] = true;
  }

  return true;
}

function isFeatured(num) {
  if (num % 2 === 1 && uniqDigits(num)) {
    return num % 7 === 0;
  }

  return false;
}

function findNextOdd(num) {
  do {
    num = num + 1;
  } while (num % 2 === 0 || num % 7 !== 0);

  return num;
}

console.log(findNextOdd(13));
console.log(findNextOdd(18));
console.log(findNextOdd(20));
console.log(findNextOdd(997));
console.log(findNextOdd(9876543186));

function featured(num) {
  num = findNextOdd(num);

  if (num > 9876543210) return "There is no possible next featured number";

  while (!isFeatured(num)) {
    num += 14;
  }

  return num;
}


console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543186));   // 9876543201
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // "There is no possible number that fulfills those requirements."

