let fizzBuzz = function () {
  for (let num = 1; num <= 100; num++) {
    let multipleOfThree = num % 3 === 0;
    let multipleOfFive = num % 5 === 0;
    if (multipleOfThree && multipleOfFive) {
      console.log('FizzBuzz');
    } else if (multipleOfThree) {
      console.log('Fizz');
    } else if (multipleOfFive) {
      console.log('Buzz');
    } else {
      console.log(num)
    }
  }
}

fizzBuzz();

