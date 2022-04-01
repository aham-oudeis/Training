'use strict';

/*
for a given number, create a bank of switches that are equal to the number
toggle the switch that many times of passes
on each pass, toggle the switch that is divisible by the current number

[1]
first pass: [1, true]

[1, 2, 3]
first pass: [true, true, true]
second pass: [true, false, true]
third pass: [true, false, true]

all the primes are toggled only twice: true, then false;
all the other numbers have some factors: [1, num, and few others]
if the numbers are not perfect squares, then they have even number of factors
if the numbers are perfect sqaures, then they have odd number of factors

all the switches are toggled by the corresponding numbers factors

1. All the switches are toggled by their factors
2. If the switch number has even number of factors, then it is toggled even number of times.
3. If the switch number has odd number of factors, then it is toggled odd number of times.
4. Toggling a switch even number of times, brings it back to the original state.
5. Perfect squares have odd number of factors.
6. All other numbers have even number of factors.
7. Prime numbers have even number of factors: one and the number.
8. All the other factors are split on two sides of the square root.
9. Hence, all the numbers except the perfect squares are in the original state, i.e., turned off.
10. Hence, all the numbers that are perfect squares are in the altered state, i.e, turned on.

function lightsOn(switches) {
  let lights = new Array(switches + 1);
  lights.fill(false);

  let count = 1;

  while (count <= switches) {
    for (let i = count; i < lights.length; i += count) {
      lights[i] = !lights[i];
    }

    count++
  }

  return lights.map((light, idx) => [light, idx])
               .filter(pair => pair[0])
               .map(pair => pair[1]);
}
*/

function isPerfectSquare(num) {
  return Number.isInteger(Math.sqrt(num))
}

function lightsOn(numOfSwtiches) {
  let lights = [];

  for (let num = 1; num <= numOfSwtiches; num++) {
    if (isPerfectSquare(num)) {
      lights.push(num);
    }
  }

  return lights;
}

console.log(lightsOn(5));        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

