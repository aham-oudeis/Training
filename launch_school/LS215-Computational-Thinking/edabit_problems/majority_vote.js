'use strict';

/*
Create a function that returns the majority vote in an array. A majority vote is an element that occurs > N/2 times in an array (where N is the length of the array).
Examples

majorityVote(["A", "A", "B"]) ➞ "A"

majorityVote(["A", "A", "A", "B", "C", "A"]) ➞ "A"

majorityVote(["A", "B", "B", "A", "C", "C"]) ➞ null
*/

function majorityVote(arr) {
  let count = {};

  arr.forEach(item => {
    count[item] = count[item] || 0;
    count[item] += 1;
  });

  let half = arr.length / 2;

  let idx = arr.findIndex(item => count[item] > half);

  return idx === -1 ? null : arr[idx];
}

console.log(majorityVote(["A", "A", "B"]) === "A");

console.log(majorityVote(["A", "A", "A", "B", "C", "A"]) === "A");

console.log(majorityVote(["A", "B", "B", "A", "C", "C"]) === null);
