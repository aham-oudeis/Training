let rlSync = require('readline-sync');
let age = Number(rlSync.question("How old are you? "));
let currentAge = `You are ${age} years old.`;

console.log(currentAge);

for (decade = 10; decade < 80; decade += 10) {
 let desc = `In ${decade} years, you will be ${age + decade} years old.`;
 console.log(desc);
 decade = decade + 10;
}

