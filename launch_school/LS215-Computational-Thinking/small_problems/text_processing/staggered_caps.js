'use strict';

function staggeredCase(string) {
  let capitalize = true;

  const staggeredCase = (acc, char) => {
    if (/[^a-z]/i.test(char)) {
      //do nothing
    } else if (capitalize) {
      char = char.toUpperCase();
      capitalize = false;
    } else {
      char = char.toLowerCase();
      capitalize = true;
    }

    return acc + char;
  };

  return [...string].reduce(staggeredCase, '');
}

console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
console.log(staggeredCase('ignore 77 the 4444 numbers'));   // "IgNoRe 77 ThE 4444 nUmBeRs"
