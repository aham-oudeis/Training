const INT_TO_STRING = {
  0: '0',
  1: '1',
  2: '2',
  3: '3',
  4: '4',
  5: '5',
  6: '6',
  7: '7',
  8: '8',
  9: '9',
}

function integerToString(num) {
  if (num === 0) {return '0'};

  let intString = '';

  while ( num > 0) {
    let remainder = num % 10;
    num = Math.floor(num / 10);
    intString = INT_TO_STRING[remainder] + intString;
  }

  return intString;
}

console.log(integerToString(4321) === '4321');
console.log(integerToString(0) === '0');
console.log(integerToString(5000) === '5000');
