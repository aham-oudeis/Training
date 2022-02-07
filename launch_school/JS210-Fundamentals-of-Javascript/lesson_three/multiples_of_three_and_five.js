function multiplesOfThreeAndFive() {
  for (let i = 1; i <= 100; i++) {
    let multipleOfThree = i % 3 === 0;
    let multipleOfFive = i % 5 === 0;

    if (multipleOfThree && multipleOfFive) {
      console.log(`'${i}!''`)
    } else if (multipleOfThree || multipleOfFive) {
      console.log(`'${i}'`)
    }
  }
}

multiplesOfThreeAndFive();
