'use strict';

function separateLiquids(glass) {
  const density = {
    H: 1.36,
    W: 1.00,
    A: 0.87,
    O: 0.8,
  };

  function flat() {
    return glass.reduce((acc, arr) => acc.concat(arr), []);
  }

  let sorted = flat().sort((a, b) => density[b] - density[a]);

  console.log('sorted', sorted);

  glass.forEach(arr => {
    console.log('arr', arr);
    for (let i = 0; i < arr.length; i++) {
      console.log(arr.length);
      arr[i] = sorted.pop();
    }
  });

  return glass;
}

//console.log(separateLiquids([['A','A','O','H'],['A', 'H', 'W', 'O'],['W','W','A','W'],['H','H','O','O']]));
//console.log(separateLiquids([['A'],['H'],['W'],['O']]));
console.log(separateLiquids([['A','H','W','O']]));

