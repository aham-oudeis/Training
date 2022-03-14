'use strict';

/*
Write a function that takes a year as an argument and returns the number of
'Friday the 13ths' in that year. You may assume that the year is greater than
1752 (when the modern Gregorian Calendar was adopted by the United Kingdom).
You may also assume that the same calendar will remain in use for the
foreseeable future.

Things to know:
1. JS returns a number for day: getDay();
2. Day starts at 0 with Sunday being zero; hence friday is 5.
*/

function fridayThe13ths(year) {
  let count = 0;

  for (let month = 1; month <= 12; month++) {
    let dayOf13th = new Date(`${month}/13/${year}`).getDay();
    // friday is 5
    if (dayOf13th === 5) count += 1;
  }

  return count;
}

console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2
