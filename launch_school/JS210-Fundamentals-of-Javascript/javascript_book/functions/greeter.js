
let rlSync = require("readline-sync");

function askName() {
  let firstName = rlSync.question("What's your first name? ");
  let lastName = rlSync.question("What's your last name? ");

  return firstName + " " + lastName;
}

console.log(`Hi, ${askName()}!`);
