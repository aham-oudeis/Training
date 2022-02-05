/*
function factorial(num) {
  for (let countDown = num - 1; countDown >= 1; countDown -= 1) {
    num *= countDown;
  };
  return num;
}
*/

function factorial(num) {
  if (num <= 2) {
    return num;
  } else {
    return num * factorial(num - 1);
  }
}

[1, 2, 3, 4, 5].forEach(num => console.log(factorial(num)));
