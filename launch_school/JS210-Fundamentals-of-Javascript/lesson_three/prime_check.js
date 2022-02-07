let primeCheck = (num) => {
  let sqRoot = Math.ceil(Math.sqrt(num))
  if (num <= 1) {return false};

  for (let i = sqRoot; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

console.log(primeCheck(43));
console.log(primeCheck(2));
console.log(primeCheck(3));
console.log(primeCheck(5));
console.log(primeCheck(55));
console.log(primeCheck(0));
console.log(primeCheck(1));
