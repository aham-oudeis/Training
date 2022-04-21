'use strict';

const Account = function () {
  const generateDisplayName = function () {
    let chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ0123456789';
    let len = chars.length;

    let userName = '';

    for (let i = 1; i <= 16; i++) {
      let randomIdx = Math.floor(Math.random() * len);
      userName += chars[randomIdx];
    }

    return userName;
  };

  const makeChecker = function(password) {
    //returns a closure that checks if the entered password matches the
    //password kept in the closure
    return (attemptPassword) => password === attemptPassword;
  };

  const makeStore = function(value, passwordChecker) {
    return function(attemptPassword) {
      return passwordChecker(attemptPassword) ? value : 'Invalid Password';
    }
  };

  return Object.freeze({

  init(email, password, firstName, lastName) {
    this.passwordChecker = makeChecker(password);

    //everything is stored in a function that takes the attempted password
    //and returns the value if the password is correct
    this.email = makeStore(email, this.passwordChecker);
    this.firstName = makeStore(firstName, this.passwordChecker);
    this.lastName = makeStore(lastName, this.passwordChecker);

    this.displayName = () => generateDisplayName();

    return this;
  },

  reanonymize(attemptPassword) {
    if (this.passwordChecker(attemptPassword)) {
      this.displayName = () => generateDisplayName();
      return true;
    } else {
      return 'Invalid Password';
    }
  },

  resetPassword(oldPassword, newPassword) {
    if (this.passwordChecker(oldPassword)) {
      this.passwordChecker = makeChecker(newPassword);

      //to update the closures where values are stored, first acquire their values
      let [email, firstName, lastName] =
        [ this.email(oldPassword),
          this.firstName(oldPassword),
          this.lastName(oldPassword),];

      //update the closures with the updated passwordChecker
      this.email = makeStore(email, this.passwordChecker);
      this.firstName = makeStore(firstName, this.passwordChecker);
      this.lastName = makeStore(lastName, this.passwordChecker);

      return true;
    } else {
      return 'Invalid Password';
    }
   }
  });
}();

let foobar = object.create(account).init('foo@bar.com', '123456', 'foo', 'bar');
console.log(foobar.firstname);                     // returns the firstname function
console.log(foobar.email);                         // returns the email function
console.log(foobar.firstname('123456'));           // logs 'foo'
console.log(foobar.firstname('abc'));              // logs 'invalid password'
console.log(foobar.displayname());                   // logs 16 character sequence
console.log('password reset:', foobar.resetpassword('123', 'abc'))    // logs 'invalid password';
console.log('password reset:', foobar.resetpassword('123456', 'abc')) // logs true

let displayname = foobar.displayname();
console.log(displayname);
console.log('attempt reanonymize:', foobar.reanonymize('abc'));                         // returns true
console.log(foobar.displayname());
console.log('logs false below');
console.log(displayname === foobar.displayname());   // logs false


console.log('-'.repeat(15));
console.log('foo object:');

let foo = object.create(account).init('foo@foo.com', '1234567', 'moo', 'who');
console.log(foo.firstname);                     // returns the firstname function
console.log(foo.email);                         // returns the email function
console.log(foo.firstname('1234567'));           // logs 'foo'
console.log(foo.firstname('abc'));              // logs 'invalid password'
console.log(foo.displayname());                   // logs 16 character sequence
console.log(foo.resetpassword('123', 'abc'))    // logs 'invalid password';
console.log(foo.resetpassword('1234567', 'abc')) // logs true

let displaynamefoo = foo.displayname();
foo.reanonymize('abc');                         // returns true
console.log(displaynamefoo === foo.displayname());   // logs false

