'use strict';

function minValue(arr,n){
  let sliced = n < 2 ? arr.slice() : arr.slice(0, 1 - n);
  let minValue = Math.min(...arr.slice(0, n));
  let minIdx = arr.indexOf(minValue);

  return sliced.map((el, idx) => {
    if (minIdx < idx) {
      minValue = Math.min(...arr.slice(idx, idx + n));
      minIdx = arr.indexOf(minValue, idx)
      return minValue;
    } else if (minValue > arr[idx + n - 1]) {
      minValue = arr[idx + n - 1];
      minIdx = idx + n - 1;
    }

    return minValue;
  });
}

console.log(minValue([1,2,3,10,-5],2));// , [1,2,3,-5])
console.log(minValue([1,-2,3,-4,5,-6,7,8],1));// , [1,-2,3,-4,5,-6,7,8])
console.log(minValue([1,-2,3,-4,5,-6,7,8],2));// , [-2,-2,-4,-4,-6,-6,7])
console.log(minValue([1,-2,3,-4,5,-6,7,8],3));// , [-2,-4,-4,-6,-6,-6])
console.log(minValue([1,-2,3,-4,5,-6,7,8],4));// , [-4,-4,-6,-6,-6])
