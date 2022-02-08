let indexOf = (array, item) => {
  let len = array.length;

  for (let i = 0; i < len; i++) {
    if (array[i] === item) {return i};
  }

  return -1;
}

console.log(indexOf([1, 2, 3, 3], 3));
console.log(indexOf([1, 2, 3, 4], 5));

let lastIndexOf = (array, item) => {
  let lastIdx = array.length - 1;

  for (let i = lastIdx; i >= 0; i--) {
    if (array[i] === item) {
      return i;
    }
  }

  return -1;
}


console.log(lastIndexOf([1, 2, 3, 3], 3));
console.log(lastIndexOf([1, 2, 3, 4], 5));
