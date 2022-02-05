
let averageOfThree = function(a, b, c) {
  return (a + b + c) / 3;
}

//2
let sum = function(...numbers) {
  let total = 0;
  for (i = 0; i < numbers.length; i++) {
    total += numbers[i]
  }

  return total
}

let avg = function(a, b, c) {
  return sum(a, b, c)/3;
}

console.log(avg(20, 25, 25));

//3
let average = function(...numbers) {
   return sum(...numbers)/(numbers.length);
}

console.log(average(2,3, 37, 32, 28));


