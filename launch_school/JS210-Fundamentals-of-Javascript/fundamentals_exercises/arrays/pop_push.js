function pop(arr) {
  let lastIdx = arr.length - 1;
  if (lastIdx < 0) { return undefined };

  let lastElement = arr[lastIdx];

  arr.length -= 1;

  return lastElement;
}

function push(arr,...item) {
  if (item.length === 0) {
    return 0;
  }

  if (item.length === 1) {
    arr[arr.length] = item;
    return arr.length;
  }

  if (item.length > 1) {
    for (let i = 0; i < item.length; i++) {
      arr[arr.length] = item[i];
    }

   return arr.length;
  }
}

// pop
const array1 = [1, 2, 3];
pop(array1);                        // 3
console.log(array1);                // [1, 2]
pop([]);                           // undefined
pop([1, 2, ['a', 'b', 'c']]);      // ["a", "b", "c"]

// push
const array2 = [1, 2, 3];
push(array2, 4, 5, 6);              // 6
console.log(array2);                // [1, 2, 3, 4, 5, 6]
push([1, 2], ['a', 'b']);          // 3
push([], 1);                       // 1
push([]);                          // 0
