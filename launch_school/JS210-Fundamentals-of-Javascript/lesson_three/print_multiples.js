let logMultiples = function (num) {
  let highestMultiple = Math.floor(100 / num) * num;
  for (let i = highestMultiple; i >= num; i -= num) {
    if (i % 2 === 1) {
      console.log(i)
    }
  }
}

logMultiples(17);
logMultiples(21);


