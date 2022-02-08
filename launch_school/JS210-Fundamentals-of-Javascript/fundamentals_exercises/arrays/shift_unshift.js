function shift(arr) {
  let shiftedElement = arr[0];
  let temp = arr.slice(1);

  arr.length = 0;

  for (let i = 0; i < temp.length; i++) {
    arr[arr.length] = temp[i];
  }

  return shiftedElement;
}

function unshift(arr, ...items) {
  let temp = arr.slice();

  arr.length = 0;

  for (let i = 0; i < items.length; i++) {
    arr[i] = items[i];
  }

  for (let i = 0; i < temp.length; i++) {
    arr[arr.length] = temp[i];
  }

  return arr.length;
}
