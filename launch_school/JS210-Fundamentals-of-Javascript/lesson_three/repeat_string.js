function repeat(string, times) {
  if (times === 0 || times > 0 ) {
    let repeatedString = '';
    let count = 1;
    while (count <= times) {
      repeatedString += string;
      count++
    }

    console.log(repeatedString);
    return repeatedString;
  } else {
    console.log(undefined);
    return undefined;
  }
}

repeat('abc', 1);       // "abc"
repeat('abc', 2);       // "abcabc"
repeat('abc', -1);      // undefined
repeat('abc', 0);       // ""
repeat('abc', 'a');     // undefined
repeat('abc', false);   // undefined
repeat('abc', null);    // undefined
repeat('abc', '  ');    // undefined
