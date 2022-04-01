'use strict';

A Man and his Umbrellas

Each morning a man walks to work, and each afternoon he walks back home.

If it is raining in the morning and he has an umbrella at home, he takes an umbrella for the journey so he doesn't get wet, and stores it at work. Likewise, if it is raining in the afternoon and he has an umbrella at work, he takes an umbrella for the journey home.

Given an array of the weather conditions, your task is to work out the minimum number of umbrellas he needs to start with in order that he never gets wet. He can start with some umbrellas at home and some at work, but the output is a single integer, the minimum total number.

The input is an array/list of consecutive half-day weather forecasts. So, e.g. the first value is the 1st day's morning weather and the second value is the 1st day's afternoon weather. The options are "clear", "sunny", "cloudy", "rainy", "windy" or "thunderstorms".

e.g. for three days, 6 values:

weather = ["rainy", "cloudy", "sunny", "sunny", "cloudy", "thunderstorms"]

N.B. He never takes an umbrella if it is not raining.
Examples:

minUmbrellas(["rainy", "clear", "rainy", "cloudy"])
// should return 2
// Because on the first morning, he needs an umbrella to take, and he leaves it at work.
// So on the second morning, he needs a second umbrella.

minUmbrellas(["sunny", "windy", "sunny", "clear"])
// should return 0
// Because it doesn't rain at all

minUmbrellas(["rainy", "rainy", "rainy", "rainy", "thunderstorms", "rainy"])
// should return 1
// Because he only needs 1 umbrella which he takes on every journey.

Strategy:
minUmbrellas(["rainy", "rainy", "rainy", "rainy", "thunderstorms", "rainy"])

-keep a counter of umbrellas
-initialize the available at home to false
-initialize the available at office to false
-iterate through the array
-even indexes are homes
-odd indexes are offices
-if the index is for home, do:
  check if the weather needs an umbrella: value is in [rainy, thunderstorms]
  check if one is available at home
    --if one is not available, increment the counter
  change the availability to false at home
  change the availability to true for office
-if the index is for office, do:
  check if the weather needs an umbrella: value is in [rainy, thunderstorms]
  check if one is available at office
    --if one is not available, increment the counter
  change the availability to false at office
  change the availability to true for home
-return the value of the counter

*/

function minUmbrellas(arr) {
  const isRainy = (weather) => ['rainy', 'thunderstorms'].includes(weather);

  let home = 0;
  let office = 0;

  arr.forEach((weather, idx) => {
    if (idx % 2 === 0 && isRainy(weather)) {
      office++;
      if (home > 0) home--;
    } else if (idx % 2 === 1 && isRainy(weather)) {
      home++;
      if (office > 0) office--;
    }
  });

  return oneAtHome + oneAtOffice;
}

