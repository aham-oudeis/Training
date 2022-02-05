/*
 The following program first logs `outer`, then logs `inner`, and then logs `outer` again.
 Because: (1) the variable `a` declared in the outer scope is shadowed by the variable `a`
 declared inside the function. (2) variable shadowing does not change the value stored in the
 variable.
 */
let a = 'outer';

function testScope() {
  let a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

//The followng programs first logs `outer`, then `inner`, and `inner again, because
//1. variable `b` is reassigned inside the function,
//2. variables from the outer scope can be reassigned from the inner scope


let b = 'outer';

function testScopeB() {
  b = 'inner';
  console.log(b);
}

console.log(b);
testScopeB();
console.log(b);
