'use strict';

function isValidTriangle(allAngles) {
  if (allAngles.some(angle => angle <= 0)) return false;

  return allAngles.reduce((a, b) => a + b) === 180;
}

function triangle(ang1, ang2, ang3) {
  let allAngles = [ang1, ang2, ang3];

  if (!isValidTriangle(allAngles)) return 'invalid';

  for (let i = 0; i < allAngles.length; i++ ) {
    let angle = allAngles[i];

    if (angle === 90) {
      return 'right';
    } else if (angle > 90) {
      return 'obtuse';
    }
  }

  return 'acute';
}

console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"
