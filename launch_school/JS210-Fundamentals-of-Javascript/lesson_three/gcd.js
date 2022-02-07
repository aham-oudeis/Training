const gcd = (num1, num2) => {
  let lowerNum = Math.min(num1, num2);

  for (i = lowerNum; i > 1; i--) {
    if (num1 % i == 0 && num2 % i == 0) {
      return i;
    }
  }

  return 1;
}

console.log(gcd(9, 3) == 3);
console.log(gcd(12, 4) == 4);
console.log(gcd(10, 5) == 5);
console.log(gcd(9, 2) == 1);
