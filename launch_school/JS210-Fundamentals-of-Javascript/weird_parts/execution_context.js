
function b() {
  function a() {
    console.log(myVar);
  }

  var myVar = "Declared inside function b."
  a()
}

var myVar = "Declared in the global scope.";

b()
