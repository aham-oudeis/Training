'use strict';

/*

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

Rules

 1.  The input string will always be lower case but maybe empty.

 2.  If the character in the string is whitespace then pass over it as if it was an empty seat

Example

wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

Strategy:
-the total number of the elements in the array would be the number of the letters

Approach:
-iterate through the index up to the length of the string
-if the current character is a space, continue
-else, slice the string up to that index, capitalize the character, join with the rest of the string
-append the resulting string to the collection
-return the collection
*/

function wave(string) {
  let collection = [];

  for (let index = 0; index < string.length; index++) {
    if (string[index] === ' ') continue;

    let previous = string.slice(0, index);
    let current = string[index].toUpperCase();
    let remaining = string.slice(index + 1);

    let item = previous + current + remaining;
    console.log(previous, current, remaining);
    collection.push(item);
  }

  return collection;
}

console.log(wave('codewars'));
