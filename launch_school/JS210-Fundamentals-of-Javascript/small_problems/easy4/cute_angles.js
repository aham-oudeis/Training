'use strict';

function dms(num) {
  num %= 360;
  let onlyDegrees = Math.floor(num);
  let minutes = (num - onlyDegrees) * 60;
  let onlyMinutes = Math.floor(minutes);
  let seconds = (minutes - onlyMinutes) * 60;
  let onlySeconds = Math.floor(seconds);

  onlyDegrees = String(onlyDegrees) + String.fromCharCode(730);
  onlyMinutes = String(onlyMinutes).padStart(2, '0') + "'";
  onlySeconds = String(onlySeconds).padStart(2, '0') + '"';

  return onlyDegrees + onlyMinutes + onlySeconds;
}

console.log(dms(30));
console.log(dms(76.73));
console.log(dms(254.6));
console.log(dms(93.034773));
console.log(dms(0));
console.log(dms(360));
