let isXor = (first, second) => {
  if (first && second) {
    return false;
  }
  return !!first || !!second;
}

console.log(isXor(false, 3));        // true
console.log(isXor('a', undefined));  // true
console.log(isXor(false, true));     // true
console.log(isXor(true, false));     // true
console.log(isXor(false, false));    // false
console.log(isXor(true, true));      // false
console.log(isXor(null, ''));        // false
console.log(isXor('2', 23));         // false

