//Write a function that takes a number of rows as the argument nStars and logs a square of
//numbers and asterisks. For example, if nStars is 7, log the following pattern:

function patternGenerator(num) {
  let lastLine = '';

  for (i = 1; i <= num; i++) {
    lastLine += String(i);
  }

  for (let i = 1; i < num; i++) {
    let str = '';
    let start = 1;

    do {
      str += start;
      start++
    } while (start <= i);

    let numOfStars = lastLine.length - str.length;

    str += "*".repeat(numOfStars);
    console.log(str);
  }

  console.log(lastLine);
}

patternGenerator(7);
patternGenerator(9);
patternGenerator(5);
patternGenerator(15);

