'use strict';

function isValidUserName(string) {
  return /[A-Za-z0-9]/.test(string) && !(/[^A-Za-z0-9]/.test(string));
}

function isValidDomain(string) {
  if (/[^A-Za-z\.]/.test(string)) {
    return false;
  }

  let domainName = string.split('.');

  if (domainName.some(item => item === '')) {
    return false;
  }

  return domainName.length > 1;
}

function isValidEmail(string) {
  if (string.match(/@/g).length === 1) {
    let [userName, domainName] = string.split('@');
    console.log(userName, domainName);
    return isValidUserName(userName) && isValidDomain(domainName);
  } else {
    return false;
  }
}

console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
console.log(isValidEmail('foo@baz.com'));             // returns true
console.log(isValidEmail('foo@baz.ph'));              // returns true
console.log(isValidEmail('HELLO123@baz'));            // returns false
console.log(isValidEmail('foo.bar@baz.to'));          // returns false
console.log(isValidEmail('foo@baz.'));                // returns false
console.log(isValidEmail('foo_bat@baz'));             // returns false
console.log(isValidEmail('foo@bar.a12'));             // returns false
console.log(isValidEmail('foo_bar@baz.com'));         // returns false
console.log(isValidEmail('foo@bar.....com'));         // returns false
