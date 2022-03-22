'use strict';

/*
A happy number is a number which yields a 1 by repeatedly summing up the square
of its digits. If such a process results in an endless cycle of numbers
containing 4, the number is said to be an unhappy number.

Create a function that accepts a number and determines whether the number
is a happy number or not. Return true if so, false otherwise.

6^2 + 7^2 => 36 + 49 => 85 => 64 + 25 => 87 => 64 + 49 => 113 => 1 + 1 + 9
=> 11 => 2 => 4 => 16 => 1 + 36 => 37 => 9 + 49 => 58 => 25 + 64 => 89 =>
64 + 81 => 145 => 1 + 16 + 25 => 41......

139 => 1 + 9 + 81 => 91 => 81 + 1 => 82 => 64 + 4 => 68 => 36 + 64 => 100

the main question is about how to determine if the cycle continues...

how long should we keep reducing the number?

say, every loop terminates with either 1 or 4.

keep reducing untill the number reaches either 1 or 4. why should it always end
in either 1 or 4?

*/

function isHappy(num) {
  function reduceDigits(number) {
    if (number === 1 || number === 4) return number;

    let numStr = String(number);

    number = [...numStr].reduce((acc, el) => {
      return acc + (Number(el) ** 2);
    }, 0);

    number = Number(number);

    return reduceDigits(number);
  }

  let reducedNum = reduceDigits(num);

  return reducedNum === 1;
}

console.log(isHappy(67) === false);
console.log(isHappy(89) === false);
console.log(isHappy(139) === true);
console.log(isHappy(1327) === false);
console.log(isHappy(2871) === false);
console.log(isHappy(3970) === true);
