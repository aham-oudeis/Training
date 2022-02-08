//Log all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.
let logOdd = function (start, end, step) {
  for (let int = start; int <= end; int += step) {
    console.log(int)
  };
}

// logOdd(1, 99, 2);

let logNums = (start, end, step) => {
  while (start <= end) {
    console.log(start);
    start += step;
  }
}

//logNums(1, 15, 2);

let logNumbers = function logInts(start, end, step) {
  // >  for inclusive, >= for exclusive
  if (start > end) {
    return;
  } else {
    console.log(start);
    return logInts(start + step, end, step);
  }
}

//logNumbers(1, 15, 2);

//log all even numbers from 1 to 99, inclusive.
//logNumbers(2, 19, 2);

//how big is the room; ask for length and breadth and calculate the area of the room
let rlSync = require('readline-sync');
let computeArea = () => {
  const METER_TO_FEET = 10.7639;

  console.log('Enter the length of the room in meters:')
  let length = Number(rlSync.prompt());
  console.log('Enter the breadth of the room in meters:')
  let breadth = Number(rlSync.prompt());

  let area = length * breadth;
  let areaInFeet = area * METER_TO_FEET;

  console.log(`The area of the room is ${area.toFixed(2)} square meters (${areaInFeet.toFixed(2)}).`)
}

//computeArea();

let tipCalculator = () => {
  let billAmount = rlSync.question('What is the bill? ');
  let tipPercent = rlSync.question('What is the tip percentage? ');

  billAmount = parseFloat(billAmount, 10);
  tipPercent = parseFloat(tipPercent, 10);

  let tipAmount = (billAmount * tipPercent) / 100;
  console.log(`The tip is \$${tipAmount.toFixed(2)}.`);
  console.log(`The total is \$${(billAmount + tipAmount).toFixed(2)}.`);
}

//tipCalculator();

let sumOrProduct = () => {
  let integer = rlSync.question('Please enter an integer greater than 0: ');
  integer = parseInt(integer);

  let operation = rlSync.question('Enter "s" to compute the sum, or "p" to compute the product: ');
  operation = operation.trim()

  if (operation === 's') { operation = 'sum' };
  if (operation === 'p') { operation = 'product' };

  let total = 1;
  let operationSym;

  if (operation === 'sum') {
    operationSym = '+'
  } else if (operation === 'product') {
    operationSym = '*'
  } else {
    console.log('Ooops! Unknown operation.');
    return;
  }

   for (let num = 2; num <= integer; num++) {
      eval(`total ${operationSym}= num`);
    }

  console.log(`The ${operation} of the integers between 1 and ${integer} is ${total}. `)
}

//sumOrProduct();

let shortLongShort = (str1, str2) => {
  if (str1.length > str2.length) {
    [str1, str2] = [str2, str1];
  }

  return str1 + str2 + str1;
}

console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
console.log(shortLongShort('', 'xyz'));         // "xyz"

//leap years part 1
//In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly
//divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by
//100, then it is not a leap year, unless the year is also evenly divisible by 400.
//

const isLeapYear = function (year) {
  if (year < 1752) {
    return year % 4 === 0;
  }

  if (year % 400 === 0) {
    return true;
  } else if (year % 100 === 0) {
    return false;
  } else if (year % 4 === 0) {
    return true;
  } else {
    return false;
  }
}

//console.log(isLeapYear(2016) === true);
//console.log(isLeapYear(2015) === false);
//console.log(isLeapYear(2100) === false);
//console.log(isLeapYear(2400) === true);;
//console.log(isLeapYear(240000) === true);
//console.log(isLeapYear(240001) === false);
//console.log(isLeapYear(2000) === true);
//console.log(isLeapYear(1900) === false);
//console.log(isLeapYear(1752) === true);
//console.log(isLeapYear(1700) === true);
//console.log(isLeapYear(1) === false);
//console.log(isLeapYear(100) === true);
//console.log(isLeapYear(400) === true);

let multisum = function (num) {
  let sum = 0;
  for (let i = 3; i <= num; i++) {
    if (i % 3 === 0 || i % 5 === 0) {
      sum += i;
    }
  }
  console.log(sum);
  return sum;
}

multisum(3);       // 3
multisum(5);       // 8
multisum(10);      // 33
multisum(1000);    // 234168

let utf16Value = function (str) {
  let total = 0;
  for (let i = 0; i < str.length; i++) {
    total += str.charCodeAt(i);
  }
  console.log(total);
  return total;
}

utf16Value('Four score');         // 984
utf16Value('Launch School');      // 1251
utf16Value('a');                  // 97
utf16Value('');                   // 0

// The next three lines demonstrate that the code
// works with non-ASCII characters from the UTF-16
// character set.
const OMEGA = "\u03A9";             // UTF-16 character 'Ω' (omega)
utf16Value(OMEGA);                  // 937
utf16Value(OMEGA + OMEGA + OMEGA);  // 2811
