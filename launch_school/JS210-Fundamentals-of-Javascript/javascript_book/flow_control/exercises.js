function show(exp) {console.log(exp)};

show((false || (true && false)) === false);
show((true || (1 + 2)) === true); // short circuiting behavior
show(((1 + 2) || true) === 3); // short circuiting behavior, returning last operand
show((true && (1 + 2)) === 3); // short circuiting behavior, returning last operand
show(((1 + 2) && true) === true); // same as above
show(((32 * 4) >= 129) === false);
show((false !== !true) === false);
show((true === 4) === false);
show((false === (847 === '847')) === true);
show((false === (847 == '847')) === false);
show(((!true || (!(100 / 5) === 20) || ((328 / 4) === 82)) || false) === true);

function evenOrOdd(num) {
  if ('number' === (typeof num)) {
    remainder = num % 2;
    (remainder === 0) ? show("even") : show("odd");
  } else {
     show("Argument must be a number.");
  }
};


evenOrOdd(5);
evenOrOdd(14);
evenOrOdd("something");

let numberRange = function(num) {
  if (num < 0) {
    show(`${num} is less than 0`);
  } else if (num <= 50) {
    show(`${num} is between 0 and 50`);
  } else if (num <= 100) {
    show(`${num} is between 51 and 100`);
  } else {
    show(`${num} is greater than 100`);
  }
};

numberRange(25);
numberRange(75);
numberRange(125);
numberRange(-25);
