let rlSync = require('readline-sync')
function countingCharacters() {
  let firstPhrase = rlSync.question("==> Please enter a phrase: ");
  let countChars = `There are ${firstPhrase.length} characters in "${firstPhrase}"`
  console.log(countChars);
}


function countingOnlyCharacters() {
  let firstPhrase = rlSync.question("==> Please enter a phrase: ");
  let charOnly = firstPhrase.replace(/\s/g, '');
  let countChars = `There are ${charOnly.length} non-empty characters in "${firstPhrase}"`
  console.log(countChars);
}

countingOnlyCharacters()
