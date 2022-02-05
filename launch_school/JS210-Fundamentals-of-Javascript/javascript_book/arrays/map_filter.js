function oddLengths(arr) {
  let lengths = arr.map(item => item.length);
  return lengths.filter(num => num %  2 !== 0);
}

let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
console.log(oddLengths(arr)); // => [1, 5, 3]
