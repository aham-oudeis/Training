function octalToDecimal(str) {
  return [...str].reverse()
                 .reduce((total, element, index) => total + (Number(element) * (8 ** index)), 0);
}

octalToDecimal('1');           // 1
octalToDecimal('10');          // 8
octalToDecimal('130');         // 88
octalToDecimal('17');          // 15
octalToDecimal('2047');        // 1063
octalToDecimal('011');
