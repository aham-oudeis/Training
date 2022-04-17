'use strict';

const student  = require('./student');
const createStudent = student.module;

function makeSchool() {
  const students = [];

  const addStudent = (student) => {
    let year = student.year;

    const validYears = ['1st', '2nd', '3rd', '4th', '5th'];
    if (!validYears.includes(year)) {
      console.log('Invalid Year');
      return;
    }

    students.push(student);
  };

  const enrollStudent = (student, course) => {
    students.addCourse(course);
  };

  const addGrade = (student, courseCode, grade) => {
    let courseObj = student.findCourse(courseCode);

    if (courseObj !== null) {
      courseObj.grade = grade;
    }
  };

  const getReportCard = (student) => {
    student.reportGrades();
  };

  const courseReport = (courseName) => {
    let namesAndGrades = students.map(stud => {
      return [stud.name, stud.gradeIn(courseName)]
    });

    let studentsWithGrades = namesAndGrades.filter(pair => pair[1] !== undefined);

    let total = studentsWithGrades.reduce((acc, pair) => acc + pair[1], 0);
    let average = total / studentsWithGrades.length;

    if (Number.isNaN(average)) return;

    console.log(courseName);
    console.log('names and grades', namesAndGrades);
    console.log('students with grades', studentsWithGrades);

    studentsWithGrades.forEach(pair => {
      let name = pair[0] + ':';
      let grade = pair[1];

      console.log(name, grade);
    });

    console.log('Course Average:', average);
  };

  return {
    addStudent,
    enrollStudent,
    addGrade,
    getReportCard,
    courseReport,
  }
}

let school = makeSchool();

let foo = createStudent('foo', '3rd');

school.addStudent(foo);

foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102, grade: 90 });
foo.addCourse({ name: 'Physics', code: 202 });

school.addGrade(foo, 101, 95);
school.getReportCard(foo);

let bar = createStudent('bar', '1st');
bar.addCourse({name: 'Math', code: 101, grade: 91});

let qux = createStudent('qux', '2nd');
qux.addCourse({name: 'Math', code: 101, grade: 93,});
qux.addCourse({name: 'Advanced Math', code: 102, grade: 90,});

school.courseReport('Advanced Math');

school.courseReport('Physics');
