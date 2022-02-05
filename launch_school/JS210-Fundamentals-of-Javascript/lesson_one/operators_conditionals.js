
//Set a variable, apples, to 3. Set a second variable, bananas, to 5. Write a conditional
//using == that checks whether apples is equal to bananas. Log a message if true.
let apples = 3;
let bananas = 5;

if (apples === bananas) {
  console.log("Equal amount of apples and bananas.")
} else {
  console.log("Unequal amount of apples and bananas.")
}

//Set the value of `bananas` to the string value '3'. Use the same conditional as the
//previous problem.
bananas = '3'

if (apples === bananas) {
  console.log("Equal amount of apples and bananas.")
} else if (apples == bananas) {
  console.log("Equal amount of apples and bananas, but values are of different types.")
} else {
  console.log("Unequal amount of apples and bananas.")
}


if (apples === bananas) {
  console.log("Equal amount of apples and bananas.")
} else  {
    if (apples == bananas) {
      console.log("Equal amount of apples and bananas, but values are of different types.")
  } else {
      console.log("Unequal amount of apples and bananas.")
  }
}

apples = bananas = 3;

let areEqual = apples == bananas;

console.log(`The amount of apples and bananas are equal: ${areEqual}.`);

bananas = undefined;

let eitherOr = apples || bananas;

console.log(eitherOr);

eitherOr = bananas || apples;

console.log(eitherOr);

bananas = 1;

eitherOr = bananas || apples;

console.log(eitherOr);

let lastName = "Aham";
let familyMessage = "Oudeis" === lastName ? "You're family": "You're not family.";

console.log(familyMessage);



