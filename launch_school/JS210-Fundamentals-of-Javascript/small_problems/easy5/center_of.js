'use strict';

function centerOf(string) {
  let length = string.length;
  let lengthIsOdd = length % 2 === 1;
  let midStart = Math.floor((length - 1) / 2);

  if (lengthIsOdd) {
    return string[midStart];
  } else {
    return string.slice(midStart, midStart + 2);
  }
}

console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"
