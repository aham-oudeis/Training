'use strict';

function showMultiplicativeAverage(arr) {
  let totalMultiple = arr.reduce((multiple, element) => multiple * element);
  let multipleAvg = totalMultiple / arr.length;

  return multipleAvg.toFixed(3);
}

showMultiplicativeAverage([3, 5]);                   // "7.500"
showMultiplicativeAverage([2, 5, 7, 11, 13, 17]);    // "28361.667"
