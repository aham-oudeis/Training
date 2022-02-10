function radianToDegress(num) {
  const ONE_RADIAN_IN_DEGREES = 180 / Math.PI;

  return (num * ONE_RADIAN_IN_DEGREES).tofixed(2);
}

let negativeInteger = -180;

console.log(Math.abs(negativeInteger))

Math.sqrt(16777216)

function randomNum(min, max) {
  let diff = Math.abs(max - min + 1);

  if (diff === 1) { return min };

  return Math.floor((Math.random() * diff)) + (min < max ? min : max);
}
