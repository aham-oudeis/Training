'use strict';

let rightTriangles = function rightTriangles(num) {
  const SPACE = ' ';
  const STAR = '*';
  let numOfStars = 1;
  let numOfSpaces;

  while (numOfStars <= num) {
    numOfSpaces = num - numOfStars;
    let line = SPACE.repeat(numOfSpaces) + STAR.repeat(numOfStars);
    console.log(line);
    numOfStars += 1;
  }
};

rightTriangles(5);
rightTriangles(9);
rightTriangles(12);
