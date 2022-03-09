'use strict';

function isBalanced(string) {
  let balance = 0;

  for (let index = 0; index < string.length; index++) {
    if (balance < 0) {
      break;
    }
    let char = string[index];

    if (char === '(') {
      balance += 1;
    } else if (char === ')') {
      balance -= 1;
    };
  }

  console.log(balance === 0);
  return balance === 0;
}

const isBalanced = function (string) {
  let parens = /\(([^\)]*)\)/;

  //repeatedly delete the parens pair, leaving everything else intact
  while (parens.test(string)) {
    string = string.replace(parens, '$1');
  };

  let verdict = !(/[\(\)]/.test(string));

  return verdict;
}

//isBalanced('What (is) this?');        // true
//isBalanced('What is) this?');         // false
//isBalanced('What (is this?');         // false
isBalanced('((What) (is this))?');    // true
//isBalanced('((What)) (is this))?');   // false
//isBalanced('Hey!');                   // true
//isBalanced(')Hey!(');                 // false
//isBalanced('What ((is))) up(');       // false
