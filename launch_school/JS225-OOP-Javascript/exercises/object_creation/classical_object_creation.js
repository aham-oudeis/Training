'use strict';

function Person(firstName, lastName, age, gender) {
  if (this instanceof Person) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.gender = gender;
  } else {
    return new Person(firstName, lastName, age, gender);
  }
}

Person.prototype.fullName = function () {
  return this.firstName + ' ' + this.lastName;
};

Person.prototype.communicate = function () {
  console.log('Communicating');
}

Person.prototype.eat = function () {
  console.log('Eating');
}

Person.prototype.sleep = function () {
  console.log('Sleeping');
}

function Doctor(firstName, lastName, age, gender, specialization) {
  if (this instanceof Doctor) {
    Person.call(this, firstName, lastName, age, gender);
    this.specialization = specialization;
  } else {
    return new Doctor(firstName, lastName, age, gender, specialization);
  }
}

//although we can manually set the prototype of an object, it is a rather slow
//operation. instead, we can reassign the prototype of Doctor to an object
//created from its prototype, i.e. Person.prototype
//But this causes the constructor property of the object to point to the wrong
//constructor. Since the new obect is constructed by Person function, the
//constructor property of the new object points to the Person constructor.
//We want to course correct this and reassign the constructor property to point
//to the current constructor.
//This introduces a further problem that the constructor property becomes enumerable
//To correct this again, use defineProperty to make the property non-enumerable
Object.setPrototypeOf(Doctor.prototype, Person.prototype);

Doctor.prototype.diagnose = function () {
  console.log('Diagnosing');
};

function Professor(firstName, lastName, age, gender, subject) {
  if (this instanceof Professor) {
    Person.call(this, firstName, lastName, age, gender);
    this.subject = subject;
  } else {
    return new Professor(firstName, lastName, age, gender, subject);
  }
}

Object.setPrototypeOf(Professor.prototype, Person.prototype);

Professor.prototype.teach = function () {
  console.log('teaching');
}

function Student(firstName, lastName, age, gender, degree) {
  if (this instanceof Student) {
    Person.call(this, firstName, lastName, age, gender);
    this.degree = degree;
  } else {
    return new Student(firstName, lastName, age, gender, degree);
  }
}

Object.setPrototypeOf(Student.prototype, Person.prototype);

Student.prototype.study = function () {
  console.log('studying');
}

function GraduateStudent(firstName, lastName, age, gender, degree, graduateDegree) {
  if (this instanceof GraduateStudent) {
    Student.call(this, firstName, lastName, age, gender, degree);
    this.graduateDegree = graduateDegree;
  } else {
    return new GraduateStudent(firstName, lastName, age, gender, degree,graduateDegree);
  }
}

Object.setPrototypeOf(GraduateStudent.prototype, Student.prototype);

GraduateStudent.prototype.research = function () {
  console.log('Researching a topic for dissertation');
}
const person = new Person('foo', 'bar', 21, 'gender');
console.log(person instanceof Person);     // logs true
person.eat();                              // logs 'Eating'
person.communicate();                      // logs 'Communicating'
person.sleep();                            // logs 'Sleeping'
console.log(person.fullName());            // logs 'foo bar'

const doctor = new Doctor('foo', 'bar', 21, 'gender', 'Pediatrics');
console.log(doctor instanceof Person);     // logs true
console.log(doctor instanceof Doctor);     // logs true
doctor.eat();                              // logs 'Eating'
doctor.communicate();                      // logs 'Communicating'
doctor.sleep();                            // logs 'Sleeping'
console.log(doctor.fullName());            // logs 'foo bar'
doctor.diagnose();                         // logs 'Diagnosing'

const graduateStudent = new GraduateStudent('foo', 'bar', 21, 'gender', 'BS Industrial Engineering', 'MS Industrial Engineering');
// logs true for next three statements
console.log(graduateStudent instanceof Person);
console.log(graduateStudent instanceof Student);
console.log(graduateStudent instanceof GraduateStudent);
graduateStudent.eat();                     // logs 'Eating'
graduateStudent.communicate();             // logs 'Communicating'
graduateStudent.sleep();                   // logs 'Sleeping'
console.log(graduateStudent.fullName());   // logs 'foo bar'
graduateStudent.study();                   // logs 'Studying'
graduateStudent.research();                // logs 'Researching'
