'use strict';

// You are given a table, in which every key is a stringified number, and each
// corresponding value is an array of characters, e.g.

// {
//   "1": ["A", "B", "C"],
//   "2": ["A", "B", "D", "A"],
// }
// Create a function that returns a table with the same keys, but each
// character should appear only once among the value-arrays, e.g.

// {
//   "1": ["C"],
//   "2": ["A", "B", "D"],
// }
// Rules
// Whenever two keys share the same character, they should be compared numerically,
// and the larger key will keep that character. That's why in the example above the
// array under the key "2" contains "A" and "B", as 2 > 1.
// If duplicate characters are found in the same array, the first occurance should be kept.

// Example 1
// input = {
//   "1": ["C", "F", "G"],
//   "2": ["A", "B", "C"],
//   "3": ["A", "B", "D"],
// }

// output = {
//   "1": ["F", "G"],
//   "2": ["C"],
//   "3": ["A", "B", "D"],
// }

// Example 2
// input = {
//   "1": ["A"],
//   "2": ["A"],
//   "3": ["A"],
// }

// output = {
//   "1": [],
//   "2": [],
//   "3": ["A"],
// }

// Example 3
// input = { "432": ["A", "A", "B", "D"],   "53": ["L", "G", "B", "C"],   "236": ["L", "A", "X", "G", "H", "X"],   "11": ["P", "R", "S", "D"],}

// output = {
//   "11": ["P", "R", "S"],
//   "53": ["C"],
//   "236": ["L", "X", "G", "H"],
//   "432": ["A", "B", "D"],
// }

/*
Approach:
-take the keys from the objects
-sort them in ascending order
-iterate through the sorted keys using indexes but do it backwards
-keep a running collection of seen elements
-create a unique values of the corresponding arrays
-iterate through the values array to create a new array
-if the seen has the element, don't apppend it
-add the element to the seen obj
-reassign the key to the collection of elements
-repeat the process for the rest of the keys and their arrays
*/

function uniq(arr) {
  return [...new Set(arr)];
}
function organizeTable(obj) {
  let keys = Object.keys(obj).sort((a, b) => a - b);
  let seen = {};
  let final = {};

  for (let i = keys.length - 1; i >= 0; i--) {
    let key = keys[i];
    let values = uniq(obj[key]);
    let updatedValues = [];

    values.forEach(num => {
      if (!seen[num]) {
        updatedValues.push(num);
        seen[num] = true;
      }
    });

    final[key] = updatedValues;
  }

  return final;
}

console.log(organizeTable({ "432": ["A", "A", "B", "D"],   "53": ["L", "G", "B", "C"],   "236": ["L", "A", "X", "G", "H", "X"],   "11": ["P", "R", "S", "D"],}))
