function oddLengths(arr) {
  let filterArray = function (acc, item) {
    let itemLength = item.length;
    if (itemLength % 2 !== 0 ) {
      return acc.concat([itemLength])
    } else
      return acc;
  }

  return arr.reduce(filterArray, [])
}

let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
console.log(oddLengths(arr)); // => [1, 5, 3]
