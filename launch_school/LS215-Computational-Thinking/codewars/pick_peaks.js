'use strict';

function pickPeaks(numbers) {
  function checkLower(idx, num) {
    for (let i = idx + 1; i < numbers.length; i++) {
      if (numbers[i] === num) continue;
      return numbers[i] < num;
    }
  }

  let pos = [];
  let peaks = [];

  for (let idx = 1; idx < numbers.length - 1; idx++) {
    let previous = numbers[idx - 1];
    let next = numbers[idx + 1];
    let current = numbers[idx];
    let isLocalMaxima = current > previous && current > next;
    let pleateauToValley = (current > previous && current === next) &&
                           checkLower(idx, current)

    if (isLocalMaxima || pleateauToValley) {
      pos.push(idx);
      peaks.push(current);
    }
  }

  return { pos: pos, peaks: peaks };
}


function pickPeaks(numbers) {
  let pos = [];
  let peaks = [];

  let peak = null;

  for (let idx = 1; idx < numbers.length; idx++) {
    let current = numbers[idx];
    let previous = numbers[idx - 1];

    if (current > previous) {
      peak = idx;
      continue;
    }

    if (peak !== null && current < previous) {
      pos.push(peak);
      peaks.push(numbers[peak]);
      peak = null;
    }
  }

  return { pos: pos, peaks: peaks };
}

console.log(pickPeaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]));
