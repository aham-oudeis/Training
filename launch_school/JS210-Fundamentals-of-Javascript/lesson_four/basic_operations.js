//write a push function
let push = function (array, item) {
  let nextIdx = array.length;
  array[nextIdx] = item;
  return array.length;
}

let pop = (array) => {
  let length = array.length;
  if (length === 0) return undefined;

  let lastElement = array[length - 1];
  array.length = length - 1;
  return lastElement;
}

let unshift = (array, item) => {
  for (let i = array.length; i > 0; i--) {
    array[i] = array[i-1];
  }
  array[0] = item;
  return array.length;
}

let shift = (array) => {
  let newLength = array.length - 1;
  let value = array[0];

  for (let i = 0; i < newLength; i ++) {
    array[i] = array[i + 1];
  }

  array.length = newLength;
  return value;
}

console.log(shift([1, 2, 3, 4]));

