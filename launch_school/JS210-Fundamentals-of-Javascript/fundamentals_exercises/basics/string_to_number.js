const CONVERSION = {
    0: 0,
    1: 1,
    2: 2,
    3: 3,
    4: 4,
    5: 5,
    6: 6,
    7: 7,
    8: 8,
    9: 9,
  }


function stringToInteger(str) {
  let intValue = 0;
  let digits = [...str].reverse();

  for (let index = 0; index < str.length; index++) {
    digit = CONVERSION[digits[index]];
    intValue += digit * Math.pow(10, index);
  }

  return intValue;
}

console.log(stringToInteger('382'));

function stringToSignedInteger(str) {
  let isSigned = str[0] == '+' || str[0] == '-';

  if (isSigned) {
    strSliced = str.slice(1);
  }

  let value = stringToInteger(strSliced);

  return str[0] == '-' ? -value : value;
}

console.log(stringToSignedInteger("+8271"));
console.log(stringToSignedInteger("-8271"));
