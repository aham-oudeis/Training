'use strict';

function swapCase(string) {
  const invertCase = (acc, char) => {
    if (/[a-z]/.test(char)) {
      char = char.toUpperCase();
    } else if (/[A-Z]/.test(char)) {
      char = char.toLowerCase();
    }

    return acc + char;
  };

  return [...string].reduce(invertCase, '');
}

console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"
