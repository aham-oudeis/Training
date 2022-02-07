function substring(string, start, end) {
  if (end === undefined) {
    end = string.length;
  }

  if (!Number(start)) {
    start = 0;
  }

  if (!Number(end) || end < 0) {
    end = 0;
  }

  if (start > end) {
    let temp = start;
    start = end;
    end = temp;
  }

  if (start === end) {
    console.log('');
    return '';
  }

  if (end > string.length) {
    end = string.length;
  }

  let subStr = '';

  for (let index = start; index < end; index++) {
    subStr += string[index];
  }

  console.log(subStr);
  return subStr;
}

let string = 'hello world';

substring(string, 2, 4);    // "ll"
substring(string, 4, 2);    // "ll"
substring(string, 0, -1);   // ""
substring(string, 2);       // "llo world"
substring(string, 'a');     // "hello world"
substring(string, 8, 20);   // "rld"
