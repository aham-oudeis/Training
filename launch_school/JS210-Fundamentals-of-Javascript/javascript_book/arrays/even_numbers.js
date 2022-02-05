let myArray = [
  [1, 3, 6, 11],
  [4, 2, 4],
  [9, 17, 16, 0],
];

function logEven(arr) {
  arr.forEach(item => {
   if (item % 2 === 0) {console.log(item)};
  })
}

/*myArray.forEach(arr => logEven(arr));*/

let numArray = [
  1, 3, 6, 11,
  4, 2, 4, 9,
  17, 16, 0,
];

let transformedArray = numArray.map(item => { if (item % 2 == 0) { return 'even' }; return 'odd'});
console.log(transformedArray);
