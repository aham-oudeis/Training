# Class Syntax

class syntax is simply a syntactic sugar that masks the underlying prototypal nature of OOP in javascript.

-Class syntax requires a `constructor` method to initialize the state of the object.

One nice thing about the class syntax is that it makes it rather easy to have private property. All you have to do is add `#` at the beginning of the property. Since the private property is enforced by JS, the class syntax seems to be more than just a syntactic sugar.

```javascript
class Account {
  #password;
  
  constructor(username, password) {
    this.username = username;
    this.#password = password;
  }

  balance(password) {
    return password === this.#password ? 1500 : 'Invalid Password';
  }

  #privateStuff() {
    return 'This is a private method!';
  }

  seePrivate() {
    return this.#privateStuff();
  }
}

let userA = new Account('someone', 'none');
console.log(userA.username);
console.log(userA.balance('hello'));

console.log(userA.seePrivate());

//the following code throws an error, bc the method is private
console.log(userA.#privateStuff())
```