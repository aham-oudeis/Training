function firstElementOf(arr) {
  return arr[0];
}

function lastElementOf(arr) {
  let lastIdx = arr.length - 1;
  return arr[lastIdx];
}

function nthElementOf(arr, index) {
  //when the index is negative or non-integer or >= length, then it returns undefined;
  return arr[index];
}

// we can insert data into an array with a negative index, because arrays are objects and
// a negative value works as a key for the object. It won't count towards the length of the array

function firstNOf(array, count) {
  return array.slice(0, count);
}

function lastNOf(array, count) {
  let startIdx = array.length - count;
  startIdx = (startIdx < 0 ? 0 : startIdx);
  return array.slice(startIdx);
}

function endsOf(beginArr, endArr) {
  return [beginArr[0], endArr.slice(-1).pop()];
}
