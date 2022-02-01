let rlSync = require('readline-sync');
let age = Number(rlSync.question("How old are you? "));
let decade = 10;
let currentAge = `You are ${age} years old.`;

console.log(currentAge);

while (decade < 50) {
 let desc = `In ${decade} years, you will be ${age + decade} years old.`;
 console.log(desc);
 decade = decade + 10;
}

