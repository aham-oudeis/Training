let rlSync = require('readline-sync')
function mathOperations() {
    firstNum = Number(rlSync.question("==> Enter the first number: "));
    secondNum = Number(rlSync.question("==> Enter the second number: "));

    let add = `==> ${firstNum} + ${secondNum} = ${firstNum + secondNum}`;
    let substract = `==> ${firstNum} - ${secondNum} = ${firstNum - secondNum}`;
    let multipley = `==> ${firstNum} * ${secondNum} = ${firstNum * secondNum}`;
    let divide = `==> ${firstNum} / ${secondNum} = ${Math.floor(firstNum / secondNum)}`;
    let remainder = `==> ${firstNum} % ${secondNum} = ${firstNum% secondNum}`;
    let power = `==> ${firstNum} ** ${secondNum} = ${Math.pow(firstNum, secondNum)}`;
    [add, substract, multipley, divide, remainder, power].forEach(item => console.log(item));
}

mathOperations();
