'use strict';

/*
Snail Sort

Given an n x n array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.

array = [[1,2,3],
         [4,5,6],
         [7,8,9]]
snail(array) #=> [1,2,3,6,9,8,7,4,5]

For better understanding, please follow the numbers of the next array consecutively:

array = [[1,2,3],
         [8,9,4],
         [7,6,5]]

         [1, 2, 3] (rotate the remaining matrix)=>
                      [4, 5]
                      [9, 6]
                      [8, 7]
        [1, 2, 3 , 4, 5] (rotate the remaining matrix)
        [6, 7]
        [9, 8]

snail(array) #=> [1,2,3,4,5,6,7,8,9]

[[ 1, 2, 3, 4, 5],
 [12,13,14,15, 6,]
 [11,10, 9, 8, 7]
]

first traverse along the row (0, 0) to (0, n)
when it reaches n, switch to incrementing from 0 to n: going from (0, n) to (n, n)
once it reaches the limit, decrease the y from n to 0: going from (n, n) to (n, 0)
once it reaches zero, then start decrementing from n to 1: going from (n, 0) to (1, 0)
repeat this process until all the rows and columns are taken up

how to keep track of row-incrementer and decrementer and column incrementer and decrementer?

we could track the rows and columns by using an array: whichever row or column is covered, it gets added to the array

take the first row and rotate the rest
take the first row and rotate the rest


*/

function transpose(matrix) {
  return matrix[0].map((_, column) => {
    return matrix.map(row => row[column])
  })
}

function rotate(matrix) {
  return transpose(matrix).reverse();
}

function snail(matrix) {
  function collectSnail(matrix, coll = []) {
    if (matrix.length === 1) return coll.concat(matrix[0]);

    coll = coll.concat(matrix[0]);
    let remainder = rotate(matrix.slice(1));

    return collectSnail(remainder, coll);
  }

  return collectSnail(matrix);
}

let array = [[1,2,3],
         [8,9,4],
         [7,6,5]];

console.log(snail(array));
