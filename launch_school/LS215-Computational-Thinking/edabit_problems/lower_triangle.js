'use strict';

/*
This challenge concerns square matrices (same number of rows and columns) as the below example illustrates:

[
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

The entries in the diagonal line from the top left to the bottom right form the main diagonal of the matrix. In this case, 1,5,9 form the main diagonal.

Write a function that returns the matrix obtained by **replacing the entries above the main diagonal with 0s.**

For example, for the matrix above you should return:

Input:
  -A square matrix, with elements that are numbers
Output:
  -matrix with elements above the diagnoal changed to zero;
  -return a new matrix;

Clarifications:
Bad input: rectangle matrix (possible): return null;
Edge cases: []: return null;

Approach:
-double iteration using map
-outer iteration (map) has index i with element (arr)
-inner interation has index j with element (num)
-if j > i, then return 0 otherwise, return num;

[
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

([1, 2, 3], 0) => [1, 2, 3].map(num, j) => [1, 0, 0];

matrix.map((arr, i) => {
  return arr.map((num, j) => {
      if (j > 1) return 0;
      return num;
}}));

function lowerTriang(matrix) {
  let zeroStart = -1;
  let lowerTriangle = matrix.map(row => {
    zeroStart += 1
    return row.map((ele, i) => {
      console.log(ele, zeroStart, i)
      return i > zeroStart ? 0 : ele;
    })

  })
  return lowerTriangle;
}

Examples:
[
  [1, 0, 0],
  [4, 5, 0],
  [7, 8, 9]
]
1: [0, 0];
4: [1, 0];
0: [0, 1];


Examples

lowerTriang([
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
])
  [x, y]
1: [0, 0];
2: [0, 1];
3: [0, 2]'
4: [1, 0];
5: [1, 1]
...

➞ [
  [1, 0, 0],
  [4, 5, 0],
  [7, 8, 9]
]

lowerTriang([
  [5, 7],
  [7, 9]
]) ➞ [
  [5, 0],
  [7, 9]
]

lowerTriang([
  [1, 8, 8, 1],
  [2, 7, 7, 2],
  [3, 6, 6, 3],
  [4, 5, 5, 4]
]) ➞ [
  [1, 0, 0, 0],
  [2, 7, 0, 0],
  [3, 6, 6, 0],
  [4, 5, 5, 4]
]
*/

function lowerTriang(matrix) {
  return matrix.map((arr, i) => {
    return arr.map((num, j) => {
        if (j > i) return 0;
          return num;
  })});
}

console.log(lowerTriang([
  [1, 8, 8, 1],
  [2, 7, 7, 2],
  [3, 6, 6, 3],
  [4, 5, 5, 4]
]));
