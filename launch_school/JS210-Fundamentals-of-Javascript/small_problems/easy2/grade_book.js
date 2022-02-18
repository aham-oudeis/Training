'use strict';

function getGrade(...grades) {
  let total = grades.reduce((x, y) => x + y);
  let average = total / grades.length;
  let grade = 'F';

  if (average >= 90 ) {
    grade = 'A';
  } else if (average >= 80) {
    grade = 'B';
  } else if (average >= 70) {
    grade = 'C';
  } else if (average >= 60) {
    grade = 'D';
  }

  console.log(grade);
  return grade;
}

getGrade(95, 90, 93);    // "A"
getGrade(50, 50, 95);    // "D"
