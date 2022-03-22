'use strict';

/*
Create a function that returns an array of the given string but offset by spaces. Here are some more precise instructions:

    Keep adding spaces on the left until you have the same number of spaces as the word length.
    Then keep removing spaces until you reach the original word.

Below are some helpful examples!
Examples

wiggleString("hello") ➞ [
  "hello",
  " hello",
  "  hello",
  "   hello",
  "    hello",
  "     hello"
  "    hello",
  "   hello",
  "  hello",
  " hello",
  "hello"
]

wiggleString("EDABIT") ➞ [
  "EDABIT",
  " EDABIT",
  "  EDABIT",
  "   EDABIT",
  "    EDABIT",
  "     EDABIT",
  "      EDABIT",
  "     EDABIT",
  "    EDABIT",
  "   EDABIT",
  "  EDABIT",
  " EDABIT",
  "EDABIT"
]

wiggleString("Wiggle Time") ➞ [
  "Wiggle Time",
  " Wiggle Time",
  "  Wiggle Time",
  "   Wiggle Time",
  "    Wiggle Time",
  "     Wiggle Time",
  "      Wiggle Time",
  "       Wiggle Time",
  "        Wiggle Time",
  "         Wiggle Time",
  "          Wiggle Time",
  "           Wiggle Time",
  "          Wiggle Time",
  "         Wiggle Time",
  "        Wiggle Time",
  "       Wiggle Time",
  "      Wiggle Time",
  "     Wiggle Time",
  "    Wiggle Time",
  "   Wiggle Time",
  "  Wiggle Time",
  " Wiggle Time",
  "Wiggle Time"
*/

function wiggleString(str) {
  let firstHalf = [];
  for (let count = 0; count <= str.length; count++) {
    let item = ' '.repeat(count) + str;
    firstHalf.push(item);
  }

  return firstHalf.concat(firstHalf.slice(0, -1).reverse());
}

console.log(wiggleString("EDABIT").length);
