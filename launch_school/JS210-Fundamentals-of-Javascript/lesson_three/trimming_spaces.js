function trim(string) {
  let len = string.length;
  let trimmedStr = '';

  for (i = 0; i < len; i++) {
    if (string[i] !== ' ') {
      trimmedStr += string[i];
    } else if (trimmedStr !== '') {
      for (j = i + 1; j < len; j++) {
        if (string[j] !== ' ') {
          trimmedStr += string[i];
          break;
        }
      }
    }
  }

  return trimmedStr;
}

console.log(trim('  abc  ') === 'abc');  // "abc"
console.log(trim('abc   ') === 'abc');   // "abc"
console.log(trim(' ab c') === 'ab c');    // "ab c"
console.log(trim(' a b  c') === 'a b  c');  // "a b  c"
console.log(trim('      ') == '');   // ""
console.log(trim('') === '');     // ""
