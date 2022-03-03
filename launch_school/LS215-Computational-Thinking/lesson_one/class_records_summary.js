'use strict';

function total(array) {
  return array.reduce((total, score) => total + score);
}

function transpose(matrix) {
  const collectColumnsFromMatrix = function (index) {
    const collectArrayItemByIndex = function (acc, element) {
      acc.push(element[index]);
      return acc;
    };

    return matrix.reduce(collectArrayItemByIndex, []);
  };

  return matrix[0].map((_, index) => collectColumnsFromMatrix(index));
}

function letterGrade(number) {
  if (number >= 93) {
    return 'A';
  } else if (number >= 85) {
    return 'B';
  } else if (number >= 77) {
    return 'C';
  } else if (number >= 69) {
    return 'D';
  } else if (number >= 60) {
    return 'E';
  } else {
    return 'F';
  }
}

function computeGrade(exams, exercises) {
  const EXAM_WEIGHT = 0.65;
  const EXERCISES_WEIGHT = 0.35;

  let examAvg = total(exams) / exams.length;
  let exercisesAvg = total(exercises);

  let grade = (examAvg * EXAM_WEIGHT) + (exercisesAvg * EXERCISES_WEIGHT);
  grade = Math.round(grade);

  return String(grade) + ` (${letterGrade(grade)})`;
}

function examsSummary(examsMatrix) {
  function avgMinMaxOf(exam) {
    function summary(average, minimum, maximum) {
      return {average, minimum, maximum};
    }

    const calculateAvg = (array) => roundTo((total(array) / array.length), 2);
    const calculateMin = (array) => Math.min(...array);
    const calculateMax = (array) => Math.max(...array);

    return summary(calculateAvg(exam), calculateMin(exam), calculateMax(exam));
  }

  function roundTo(number, decimal) {
    return parseFloat(number.toFixed(decimal));
  }

  let examsByRow = transpose(examsMatrix);

  return examsByRow.map(avgMinMaxOf);
}

function generateClassRecordSummary(scoresObj) {
  function summary(studentGrades, exams) { 
    return {studentGrades, exams};
  }

  function extractExamsAndExercises(obj) {
    const examsExercises = (info) => [info.scores.exams, info.scores.exercises];
    return Object.values(obj).map(examsExercises);
  }

  function extractOnlyExams(examsAndExercises) {
    return examsAndExercises.map(arr => arr[0]);
  }

  function scoresToGrades(examsAndExercises) {
    return examsAndExercises.map(arr => computeGrade(...arr));
  }

  let scores = extractExamsAndExercises(scoresObj);
  let examsScores = extractOnlyExams(scores);
  let studentGrades = scoresToGrades(scores);
  let exams = examsSummary(examsScores);

  return summary(studentGrades, exams);
}

let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

console.log(generateClassRecordSummary(studentScores));

/* returns:
{
  studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
  exams: [
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ],
}
*/

