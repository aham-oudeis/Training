'use strict';

/*
Create a function that expands a decimal number into a string as shown below:

25.24 ➞ "20 + 5 + 2/10 + 4/100"
70701.05 ➞ "70000 + 700 + 1 + 5/100"
685.27 ➞ "600 + 80 + 5 + 2/10 + 7/100"

Examples

expandedForm(87.04) ➞ "80 + 7 + 4/100"

expandedForm(123.025) ➞ "100 + 20 + 3 + 2/100 + 5/1000"

expandedForm(50.270) ➞ "50 + 2/10 + 7/100"

Input: a decimal number
Output: a string representation of all the digits, concatanated with +

Examples:
87.04 => 80 + 7 + 0/10 + 4/100 => 80 + 7 + 0/10 + 4/100
123.025 => "100 + 20 + 3 + 2/100 + 5/1000"
50.270) => "50 + 2/10 + 7/100"

convert the number into decimal and non-decimal bits

Data Structures
-arrays
-index of the digit

Strategy:
-split the number into decimal and non-decimal digits
-split the decimal digits and reverse it
-map the non-decimal digits based on their index
  --since the items are strings, convert them to numbers
  --the first digit occupies the 0 index
  --multiply the given number with the power of 10 to the index
-filter the ones that are not zeros
-map the decimal digits
  --the first digit occupies the index 0 and is divided by 10
  --that means, division uses 10 to the power of index + 1
  --mapped as strings
-filter the strings that do not start with zeros
*/

function expandedForm(float) {
  let [nonDecimal, decimal] = String(float).split('.');

  const digitValue = (digit, idx) => {
    digit = Number(digit);
    digit *= (10 ** idx)
    return digit;
  };

  const decimalValue = (digit, idx) => {
    return digit + '/' + String(10 ** (idx + 1));
  }

  const nonZeros = (item) => item !== 0;
  const nonZeroStart = (item) => !item.startsWith('0');

  nonDecimal = [...nonDecimal].reverse().map(digitValue).filter(nonZeros).reverse();
  decimal = [...decimal].map(decimalValue).filter(nonZeroStart);

  return nonDecimal.concat(decimal).join(' + ');
}

console.log(expandedForm(87.04) === "80 + 7 + 4/100");

console.log(expandedForm(123.025) === "100 + 20 + 3 + 2/100 + 5/1000");

console.log(expandedForm(50.270) === "50 + 2/10 + 7/100");
