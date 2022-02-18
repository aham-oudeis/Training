function crunch(string) {
  let result = '';

  for (let char of string) {
    let lastChar = result[result.length - 1];
    if (char !== lastChar) {
      result += char;
    }
  }

  console.log(result);
  return result;
}

crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
crunch('');                           // ""
