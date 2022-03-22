'use strict';

function chunk(arr, size) {
  let numOfSubArr = Math.ceil(arr.length / size);

  let chunks = [];

  for (let idx = 0; idx < numOfSubArr; idx++) {
    let startIdx = idx * size;
    chunks.push(arr.slice(startIdx, startIdx + size));
  }

  return chunks;
}

console.log(chunk([1, 2, 3, 4], 2));// [[1, 2], [3, 4]]

console.log(chunk([1, 2, 3, 4, 5, 6, 7], 3));// [[1, 2, 3], [4, 5, 6], [7]]

console.log(chunk([1, 2, 3, 4 ,5], 10));// [[1, 2, 3, 4, 5]]
