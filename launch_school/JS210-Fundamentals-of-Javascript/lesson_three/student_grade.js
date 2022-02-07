const rlSync = require('readline-sync');

let studentGrade = () => {
  grade1 = Number(rlSync.question('Enter score 1: '));
  grade2 = Number(rlSync.question('Enter score 2: '));
  grade3 = Number(rlSync.question('Enter score 3: '));

  average = (grade1 + grade2 + grade3) / 3

  if (average >= 90) {
    grade = 'A';
  } else if (average >= 70) {
    grade = 'B';
  } else if (average >= 50) {
    grade = 'C';
  } else {
    grade = 'F';
  }

  console.log(`Based on the average of your 3 scores your letter grade is "${grade}".`);
}

studentGrade();
