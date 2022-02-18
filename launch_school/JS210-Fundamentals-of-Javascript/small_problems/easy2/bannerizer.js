function logInBox(string) {
  let length = string.length;
  const verticalPad = 2;

  let borderLine = '+' + '-'.repeat(length + verticalPad) + '+';
  let emptyLine = '|' + ' '.repeat(length + verticalPad) + '|';

  let paddingAbove = borderLine + '\n' + emptyLine;
  let paddingBelow = emptyLine + '\n' + borderLine;
  let stringLine = '|' + ' ' + string + ' ' + '|';

  [paddingAbove, stringLine, paddingBelow].forEach(item => console.log(item));
}

logInBox('To boldly go where no one has gone before.');
logInBox('');
