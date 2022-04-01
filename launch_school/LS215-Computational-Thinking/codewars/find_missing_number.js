'use strict';

/*
start=> 3:14

In this Kata, you will be given a string of numbers in sequence and your task will be to return the missing number. If there is no number missing or there is an error in the sequence, return -1.

For example:

missing("123567") = 4
missing("899091939495") = 92
missing("9899101102") = 100
missing("599600601602") = -1 -- no number missing
missing("8990919395") = -1 -- error in sequence. Both 92 and 94 missing.

The sequence will always be in ascending order.

Input: a string of numbers that are in ascending order
Output: the missing number if there is only one missing number

Rules:
-if there is no missing number, return -1
-if there is more than one missing number, return -1
-the numbers will always be in ascending order

Data Structures
-arrays
-collection of numbers in ascending order

Strategy:
---THIS IS A WRONG ALGORITHM, BUT GOOD TO KNOW IT DOESN"T WORK
--CODE IS CORRECT, THOUGH
-slice the string into a give number of slices: array
  -match and the number of digits
-check if the array has ascending sequence
  --iterate through the array and keep track of the last number
  --if the current number is less than or equal to prev number
    then return false
  --otherwise, at the end of iteration, return true
-find the array with ascending sequence
-iterate through the ascending sequence (after the first element) and keep track of the missing element
  --initialize the missing array
  --initialize prev num to the first element
  --inside the loop:
    --initialize the next to prev + 1;
    --check if the current element is the next
    --if it is not, then append next to the collection
    --reassign the prev element to next;
-if the length of the collection of missing elements is 1, return the stored value; else, return -1
*/

function ascendingNums(string, len) {
  //this method takes the string and the size of the oneGreater number
  //and returns either the missing numbers (if it is proper sequence)
  //or, it returns undefined
  let missingNums = [];

  //start by initializing the oneGreater number to prev
  let prev = Number(string.slice(0, len));

  let idx = len;

  while (idx <= (string.length - len)) {
    //the next in the sequence has to be either one greater or two greater
    let oneGreater = prev + 1;
    let twoGreater = oneGreater + 1;

    let nextOneGreaterStr = string.slice(idx, idx + String(oneGreater).length);
    let nextTwoGreaterStr = string.slice(idx, idx + String(twoGreater).length);

    let matchesOneGreater = String(oneGreater) === nextOneGreaterStr
    let matchesTwoGreater = String(twoGreater) === nextTwoGreaterStr

    if (matchesOneGreater) {
      prev = oneGreater;
    } else if (matchesTwoGreater) {
      missingNums.push(oneGreater);
      prev = twoGreater;
    } else {
      //if the next in the sequence is neither, return the function
      return;
    }

    len = String(prev).length;
    idx += len;
  }

  return missingNums;
}

function missing(string) {
  let counter = 1;
  let missingNums;

  while (!missingNums || counter > string.length) {
    missingNums = ascendingNums(string, counter);
    counter++
  }

  return missingNums.length === 1 ? missingNums.pop() : -1;
}
console.log(missing('787980828384'));
console.log(missing("123567"));//,4);
console.log(missing("899091939495"));//,92);
console.log(missing("12131416"));//,15); 1 2 13 14 16
console.log(missing("9899101102"));//,100);
console.log(missing("599600601602"));//,-1);
console.log(missing("8990919395"));//,-1);
console.log(missing("998999100010011003"));//,1002);
console.log(missing("99991000110002"));//,10000);
console.log(missing("979899100101102"));//,-1);
console.log(missing("900001900002900004900005900006"));//,900003);

