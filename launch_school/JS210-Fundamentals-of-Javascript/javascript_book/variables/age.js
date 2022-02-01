let age = 20;
let decade = 10;
let currentAge = "You are 20 years old.";

console.log(currentAge);

while (decade < 50) {
 let desc = `In ${decade} years, you will be ${age + decade} years old.`;
 console.log(desc);
 decade = decade + 10;
}

