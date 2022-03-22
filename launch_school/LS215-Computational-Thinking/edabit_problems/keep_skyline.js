'use strict';

/*

In a 2 dimensional array, each value represents the height of a building located there. You are allowed to increase the height of any number of buildings, by any amount (the amounts can be different for different buildings).

At the end, the "skyline" when viewed from all four directions of the grid, i.e. top, bottom, left, and right, must be the same as the skyline of the original grid. A city's skyline is the outer contour of the rectangles formed by all the buildings when viewed from a distance.

Create a function that updates the heights of the buildings to the maximum possible under conditions: keep the original vertical and horizontal skylines; keep the zero heights equal to zero.
Examples

Approach:
-maxValue for row
  --map the max value from the given array
-maxValue for columns
  --map the max value of the transposed matrix
-create a function to transpose a given matrix
  --map the first element of the array with the index
  --for each index map the array and generate the columns
  --for the given outer index and inner index map the elements by acessing the element of the matrix with inner index and at position outer index

--now map the given matrix by transforming the elements based on the max value that is the lowest for that given index position


[
  [3, 0, 8, 4],
  [2, 4, 5, 7],
  [9, 2, 6, 3],
  [0, 3, 1, 0]
]

// Skyline viewed from top or bottom: [9, 4, 8, 7]
// Skyline viewed from left or right: [8, 7, 9, 3]

[
  [8, 0, 8, 7],
  [7, 4, 7, 7],
  [9, 4, 8, 7],
  [0, 3, 3, 0]
]

// Grid after increasing the height of buildings
// without affecting skylines.
*/

function transpose(matrix) {
  return matrix[0].map((_, outerIdx) => {
    return matrix.map(row => row[outerIdx]);
  });
}

function maxSkyline(matrix) {
  let rowMax = matrix.map(arr => Math.max(...arr));
  let columnMax = transpose(matrix).map(arr => Math.max(...arr));

  return matrix.map((arr, row) => {
    return arr.map((el, column) => {
      if (el === 0) return el;
      return Math.min(rowMax[row], columnMax[column]);
    });
  });
}

console.log(maxSkyline([
  [3, 0, 8, 4],
  [2, 4, 5, 7],
  [9, 2, 6, 3],
  [0, 3, 1, 0]
])[3]);
