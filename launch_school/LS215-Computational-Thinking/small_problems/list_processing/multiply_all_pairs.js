function multiplyAllPairs(arr1, arr2) {
  let collection = [];

  arr1.forEach(firstNum => {
    arr2.forEach(secondNum => {
      let product = firstNum * secondNum;
      collection.push(product);
    });
  });

  return collection.sort((a, b) => a - b);
}

let result = multiplyAllPairs([2, 4], [4, 3, 1, 2]);    // [2, 4, 4, 6, 8, 8, 12, 16]

console.log(result);
