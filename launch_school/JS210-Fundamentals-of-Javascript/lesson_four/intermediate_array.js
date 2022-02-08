function oddElementsOf(arr) {
  let oddIndexedElements = [];

  for (let i = 1; i < arr.length; i += 2) {
    oddIndexedElements.push(arr[i]);
  }

  return oddIndexedElements;
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits));    // returns [8, 16, 42]

function doubleInReverse(arr) {
  let finalArr = [];

  for (let i = 0; i < arr.length; i++) {
    finalArr.push(arr[i]);
  }

  for (let i = (arr.length - 1); i >= 0; i--) {
    finalArr.push(arr[i]);
  }

  console.log(finalArr);
  return finalArr;
}

function sortDescending(arr) {
  return arr.slice().sort((a, b) => b - a);
}

function matrixSums(arr) {
  let sumArr = (array) => {
    return array.reduce(((acc, el) => acc + el), 0)
  }
 return arr.map(sumArr);
}

matrixSums([[2, 8, 5], [12, 48, 0], [12]]);  // returns [15, 60, 12]

function uniqueElements(arr) {
  let unique = [];

  for (let i = 0; i < arr.length; i++) {
    if (unique.includes(arr[i])) continue;
    unique.push(arr[i]);
  }

  return unique;
}
