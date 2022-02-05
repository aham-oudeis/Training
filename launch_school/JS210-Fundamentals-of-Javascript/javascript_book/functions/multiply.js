let rlSync = require("readline-sync");

function multiply() {
  firstNumber = Number(rlSync.question("Enter the first number: "));
  secondNumber = Number(rlSync.question("Enter the second number: "));
  let multiple = firstNumber * secondNumber;
  console.log(`${firstNumber} * ${secondNumber} = ${multiple}`)
}

multiply()
