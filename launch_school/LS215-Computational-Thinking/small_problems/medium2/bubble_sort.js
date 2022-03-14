'use strict';

function bubbleSort(array) {
  let switched = true;
  let length = array.length;

  while (switched) {
    switched = false;

    for (let index = 0; index < length; index++) {
      let current = array[index];
      let next = array[index + 1];

      if (current > next) {
        //switch the order and toggle the switched variable
        array[index], array[index + 1]= next, current

        switched = true;
      }
    }

    length -= 1;
  }

  return array;
}

const array1 = [5, 3];
bubbleSort(array1);
console.log(array1);    // [3, 5]

const array2 = [6, 2, 7, 1, 4];
bubbleSort(array2);
console.log(array2);    // [1, 2, 4, 6, 7]

const array3 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array3);
console.log(array3);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
