let isPrime = (num) => {
  let sqRoot = Math.ceil(Math.sqrt(num))
  if (num <= 1) {return false};

  for (let i = sqRoot; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

let generatePrimesUpto = function (num, collection) {
  let lastIdx = collection.length - 1;
  let lastPrime = collection[lastIdx];
  let nextOddElement = lastPrime +  2;
- 1;
  if (num > nextOddElement) {
   for (i = nextOddElement; i < num; i += 2) {
    if (isPrime(i)) {
      collection.push(i);
    }
   }
  }
}

let checkGoldbach = function goldbach(num) {
  function trimPrimesUpto(num) {
    let idxOfPrimeGreaterThan = goldbach.primes.findIndex(x => x > num);

    if (idxOfPrimeGreaterThan === -1) { idxOfPrimeGreaterThan = goldbach.primes.length; }

    return goldbach.primes.slice(0, idxOfPrimeGreaterThan);
  }

  if (num % 2 === 1 || num < 4) {
    return null;
  }

  if (!goldbach.primes) {
    goldbach.primes = [1, 2, 3];
  }

  //generate primes if the primes are not yet generated for up to the number:
  generatePrimesUpto(num, goldbach.primes);

  //if the primes included in goldbach.primes are already more more than num, then trim:
  let onlyUsefulPrimes = trimPrimesUpto(num);
  let lastIndex = onlyUsefulPrimes.length - 1;
  let indexOfHalf = onlyUsefulPrimes.findIndex(x => x > (num / 2));
  let primePairs = [];

  for (i = 0; i < indexOfHalf; i++) {
    for (j = lastIndex; j >= indexOfHalf; j--) {
      let firstPrime = onlyUsefulPrimes[i];
      let secondPrime = onlyUsefulPrimes[j];
      let sum = firstPrime + secondPrime;

      if (sum === num) {
        primePairs.push([firstPrime, secondPrime]);
        break;
      }

      if (sum < num ) {
        break;
      }
    }
  }

  primePairs.forEach(x => console.log(x));
}

checkGoldbach(100);
console.log(checkGoldbach.primes);
checkGoldbach(150);
console.log(checkGoldbach.primes);
checkGoldbach(16);
console.log(checkGoldbach.primes);
