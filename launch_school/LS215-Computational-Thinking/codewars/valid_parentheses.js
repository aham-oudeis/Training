'use strict';

/*
Write a function that takes a string of parentheses, and determines
if the order of the parentheses is valid. The function should return
true if the string is valid, and false if it's invalid.

"()"              =>  true
")(()))"          =>  false
"("               =>  false
"(())((()())())"  =>  true

example:
")(()))"          =>  false
[)]-- return false;

approach:
-initalize a stack to keep track of characters
-iterate through the chars
-if the last char in the stack is ')' return false;
-if the last char in the stack is '(' and the current char is ')', then pop the stack
-else append the '(' to the stack
-at the end of the iteration, check if the stack is empty;
*/

function validParentheses(string) {
  let stack = [];
  let length = string.length;

  for (let idx = 0; idx < length; idx++) {
    let char = string[idx];
    let lastChar = stack.slice(-1)[0];

    if (lastChar === ')') return false; //early return

    if (char === ')' && lastChar === '(' ) {
      stack.pop()
    } else {
      stack.push(char);
    }
  };

  return stack.length === 0;
}

function validParentheses(string) {
  let balance = 0;

  for (let i = 0; i < string.length; i++) {
    if (string[i] === '(') balance += 1;
    if (string[i] === ')') balance -= 1;
    if (balance < 0) return false;
  }

  return balance === 0;
}

console.log(validParentheses("()"));//              =>  true
console.log(validParentheses(")(()))"));//          =>  false
console.log(validParentheses("("));//               =>  false
console.log(validParentheses("(())((()())())"));//  =>  true
