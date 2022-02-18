function stringy(num) {
  let times = Math.floor(num / 2);
  let remainder = num % 2;

  result = '10'.repeat(times) + '1'.repeat(remainder);

  console.log(result);
  return result;
}

stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"
