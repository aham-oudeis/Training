// something close to a slice function

function slice(array, start, end) {
  let slicedArr = [];

  for (let i = start; i < end; i++) {
    slicedArr.push(array[i]);
  }

  console.log(slicedArr);
  return slicedArr;
}

slice([1, 2, 3, 4, 5], 0, 2);                      // [ 1, 2 ]
slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3);  // [ 'b', 'c' ]

// something close to splice

function splice(array, start, length) {
  let unmodifiedIdxStart = start + length;
  let splicedSlice = array.slice(start, start + length);
  let unmodifiedSlice = array.slice(unmodifiedIdxStart, array.length);
  let lengthToCopy = unmodifiedSlice.length;

  array.length = start;

  for (let i = 0; i < lengthToCopy; i++) {
    array.push(unmodifiedSlice[i]);
  }

  console.log(splicedSlice);
  return splicedSlice;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
splice(count, 2, 5);                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]

// something like concat

function concat(arr1, arr2) {
  let collection = [];

  for (let i = 0; i < arr1.length; i++) {
    collection.push(arr1[i]);
  }

  for (let i = 0; i < arr2.length; i++) {
    collection.push(arr2[i]);
  }

  console.log(collection);
  return collection;
}

concat([1, 2, 3], [4, 5, 6]);       // [ 1, 2, 3, 4, 5, 6 ]

// something like join

function join(array, delimiter) {
  let string = '';
  let lastIdx = array.length - 1;
  for (let i = 0; i < lastIdx; i++) {
    string += String(array[i]) + delimiter;
  }

  string = string + String(array[lastIdx]);
  console.log(string );
  return string;
}

join(['bri', 'tru', 'wha'], 'ck ');       // 'brick truck wha'
join([1, 2, 3], ' and ');                 // '1 and 2 and 3'
