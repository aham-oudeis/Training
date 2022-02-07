function substr(string, start, length) {
  let startIdx = (start >= 0 ? start : string.length + start);
  let len = (length >= 0 ? length : 0);

  if (startIdx + len > string.length) {
    len = string.length - startIdx
  }

  let slicedStr = '';

  for (let i = startIdx; i < (startIdx + len); i++) {
    slicedStr += string[i];
  }

  console.log(slicedStr);
  return slicedStr;
}

let string = 'hello world';

substr(string, 2, 4);      // "llo "
substr(string, -3, 2);     // "rl"
substr(string, 8, 20);     // "rld"
substr(string, 0, -20);    // ""
substr(string, 0, 0);      // ""
