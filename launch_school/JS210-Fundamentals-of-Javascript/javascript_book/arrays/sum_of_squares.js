function sumOfSquares(arr) {
  return arr.reduce((acc, item) => acc + (item * item), 0);
}

let array = [3, 5, 7];
console.log(sumOfSquares(array)); // => 83
