'use strict';

function createStudent(name, year) {
  const info = function () {
    console.log(`${name} is a ${year} year student`);
  };

  const courses = [];

  const listCourses = () => { console.log(courses); };

  const addCourse = (course) => {
    courses.push(course);
  };

  const gradeIn = (courseName) => {
    for (let obj of courses) {
      if (obj.name === courseName) return obj.grade;
    }
  };

  const findCourse = (courseCode) => {
    let courseIdx = courses.findIndex(obj => obj.code === Number(courseCode));

    if (courseIdx === -1) return null;

    return courses[courseIdx];
  };

  const notes = {};

  const addNote = (courseCode, note) => {
    let courseObj = findCourse(courseCode);

    if (!courseObj) return;

    let courseName = courseObj.name;

    notes[courseName] ||= [];
    notes[courseName].push(note);
  };

  const viewNotes = () => {
    for (let key in notes) {
      let line = `${key}: ${notes[key].join('; ')}`;
      console.log(line);
    }
  };

  const updateNote = (courseCode, note) => {
    let courseObj = findCourse(courseCode);

    if (!courseObj) return;

    let courseName = courseObj.name;
    notes[courseName] = [];
    notes[courseName].push(note);
   }

  const reportGrades = () => {
    courses.forEach(obj => {
      let name = obj.name + ':';
      let grade = obj.grade || 'In Progress';

      console.log(name, grade);
    });
  };

  return {
    name,
    info,
    year,
    listCourses,
    findCourse,
    gradeIn,
    reportGrades,
    addCourse,
    addNote,
    viewNotes,
    updateNote,
  };
}

/*
let foo = createStudent('Foo', '1st');
foo.info();
// "Foo is a 1st year student"
foo.listCourses();
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
// "Advance Math: Difficult subject"
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// "Math: Fun course"
// "Advanced Math: Difficult subject"
*/

exports.module = createStudent;
