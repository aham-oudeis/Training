'use strict';

/*
Write a function, which takes a non-negative integer (seconds) as input and returns the time in a human-readable format (HH:MM:SS)

    HH = hours, padded to 2 digits, range: 00 - 99
    MM = minutes, padded to 2 digits, range: 00 - 59
    SS = seconds, padded to 2 digits, range: 00 - 59

The maximum time never exceeds 359999 (99:59:59)

Input: time in seconds
Output: string formatted as 'HH:MM:SS'

approach
-there are 60 * 60 seconds in an hour
-there are 60 seconds in a minute
-whatever remains are the second

pseudocode:
-SECONDS_IN_MINUTE = 60;
-MINUTES_IN_HOUR = 60;
-SECONDS_IN_HOUR = SECONDS_IN_MINUTE * MINUTES_IN_HOUR;
-for a given num,
-take the floor of division between num and SECONDS_IN_HOUR: hours
-take the remainder of division between num and SECONDS_IN_HOUR and divide it by MINUTES_IN_HOUR (also the floor): minutes
-take the remainder as the seconds and divide it by 60

convert the hours, minutes, and seconds to string and pad it with zeros;
*/

function humanReadable(seconds) {
  const SECONDS_IN_MINUTE = 60;
  const MINUTES_IN_HOUR = 60;
  const SECONDS_IN_HOUR = SECONDS_IN_MINUTE * MINUTES_IN_HOUR;

  let hours = Math.floor(seconds / SECONDS_IN_HOUR);
  let remainingSeconds = seconds % SECONDS_IN_HOUR;

  let minutes = Math.floor(remainingSeconds / SECONDS_IN_MINUTE);
  seconds = remainingSeconds % SECONDS_IN_MINUTE;

  const padNum = num => String(num).padStart(2, '0');

  return [hours, minutes, seconds].map(padNum).join(':');
}

console.log(humanReadable(60));
console.log(humanReadable(3600));
console.log(humanReadable(45296));
