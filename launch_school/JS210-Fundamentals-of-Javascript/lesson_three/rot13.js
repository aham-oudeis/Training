const ROTATION = 13;
const MID_ASCII_CODE_OF_UPPER_CASE = 'N'.charCodeAt(); // 78
const MID_ASCII_CODE_OF_LOWER_CASE = 'n'.charCodeAt(); // 110

function rotateAlphabet13(asciiCode, midCode) {
  if (asciiCode < midCode) {
    return String.fromCharCode(asciiCode + ROTATION);
  } else {
    return String.fromCharCode(asciiCode - ROTATION);
  };
}

function rot13(str) {
  let strLength = str.length;
  let rotatedStr = '';

  for (let index = 0; index < strLength; index++) {
    let char = str[index];
    let asciiCode = char.charCodeAt();

    if (/[A-Z]/.test(char)) {
      rotatedStr += rotateAlphabet13(asciiCode, MID_ASCII_CODE_OF_UPPER_CASE);
    } else if (/[a-z]/.test(char)) {
      rotatedStr += rotateAlphabet13(asciiCode, MID_ASCII_CODE_OF_LOWER_CASE);
    } else {
      rotatedStr += char;
    };
  };

  return rotatedStr;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));

// logs:
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('abcdefghijklmnopqrstuvwxyz')));
console.log(rot13(rot13('abcdefghijklmnopqrstuvwxyz'.toUpperCase())));
