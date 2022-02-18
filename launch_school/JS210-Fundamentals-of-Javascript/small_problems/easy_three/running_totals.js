'use strict';

function runningTotal(arr) {
  let collection = [];

  let total = arr.reduce((sum, element) => {
    collection.push(sum);
    return sum + element;
  });

  collection.push(total);

  return collection;
}

runningTotal([1, 3, 12]);
