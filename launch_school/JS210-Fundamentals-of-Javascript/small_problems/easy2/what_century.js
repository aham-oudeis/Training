'use strict';

function century(year) {
  const suffix = { 1: 'st', 2: 'nd', 3: 'rd', };
  let century = year / 100;
  century = Number.isInteger(century) ? century : Math.ceil(century);

  let lastDigit = century % 10;
  let centurySuffix = 'th';
  let lastTwoDigit = century % 100;
  let isTenthRange = lastTwoDigit <= 20 && lastTwoDigit >= 10;

  if (!(isTenthRange) && suffix[lastDigit]) {
    centurySuffix = suffix[lastDigit];
  }

  let result = String(century) + centurySuffix;
  console.log(result);
  return result;
}

century(2000);        // "20th"
century(2001);        // "21st"
century(1965);        // "20th"
century(256);         // "3rd"
century(5);           // "1st"
century(10103);       // "102nd"
century(1052);        // "11th"
century(1127);        // "12th"
century(11201);       // "113th"
