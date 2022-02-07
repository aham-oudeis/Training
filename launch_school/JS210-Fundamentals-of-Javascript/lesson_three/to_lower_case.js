function toLowerCase(string) {
  let lower = '';
  let len = string.length;
  const upperCodeRange = ['A'.charCodeAt(0), 'Z'.charCodeAt(0)];

  for (let i = 0; i < len; i++) {
    let asciiCode = string[i].charCodeAt(0);
    if (asciiCode >= upperCodeRange[0] && asciiCode <= upperCodeRange[1]) {
      asciiCode += 32;
      lowerLetter = String.fromCharCode(asciiCode);
      lower += lowerLetter;
    } else {
      lower += string[i];
    }
  }

  console.log(lower);
  return lower;
}

toLowerCase('ALPHABET');    // "alphabet"
toLowerCase('123');         // "123"
toLowerCase('abcDEF');      // "abcdef"
