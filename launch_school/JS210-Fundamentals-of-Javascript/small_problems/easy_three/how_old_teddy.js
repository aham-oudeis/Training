'use strict';

function logAge() {
  const minimum = 20;
  const maximum = 200;
  const range = maximum - minimum + 1;

  let randomAge = Math.floor(Math.random() * range) + minimum;
  console.log(`Teedy is ${randomAge} years old!`);
}

console.log(logAge());
