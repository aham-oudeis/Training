let rlSync = require('readline-sync');
let guessPassword = () => {
  let correctPassword = "password";
  let count = 1;

  do {
    password = rlSync.question("Please enter the password: ");
    if (password === correctPassword) {
      console.log("You are successfully logged in.");
      return;
    }
    count++;
  } while (count <= 3);

  return console.log("You have been denied access!");
}

guessPassword()
