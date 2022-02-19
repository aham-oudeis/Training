'use strict';

function countOccurrences(arr) {
  let count = {};

  arr.forEach(item => {
    count[item] = count[item] || 0;
    count[item] += 1;
  });

  Object.keys(count).forEach(key => {
    console.log(`${key} => ${count[key]}`);
  });
}

const vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
