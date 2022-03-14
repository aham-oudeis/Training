'use strict';

function letterPercentages1(string) {
  const percentageObj = function (lowercase, uppercase, neither) {
    return { lowercase, uppercase, neither };
  };

  let lowercase = 0;
  let uppercase = 0;
  let neither = 0;
  let total = 0;

  [...string].forEach(char => {
    total += 1;

    if (/[a-z]/.test(char)) {
      lowercase += 1;
    } else if (/[A-Z]/.test(char)) {
      uppercase += 1;
    } else {
      neither += 1;
    }
  });

  const convertPercentage = (number) => {
    return ((number / total) * 100).toFixed(2);
  };

  [lowercase, uppercase, neither] =
    [lowercase, uppercase, neither].map(convertPercentage);

  return percentageObj(lowercase, uppercase, neither);
}

function letterPercentages(string) {
  const percentageObj = function (lowercase, uppercase, neither) {
    return { lowercase, uppercase, neither };
  };

  let lowercase = (string.match(/[a-z]/g) || []).length;
  let uppercase = (string.match(/[A-Z]/g) || []).length;
  let total = string.length;
  let neither = total - lowercase - uppercase;

  const convertPercentage = (number) => {
    return ((number / total) * 100).toFixed(2);
  };

  [lowercase, uppercase, neither] =
    [lowercase, uppercase, neither].map(convertPercentage);

  return percentageObj(lowercase, uppercase, neither);
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
