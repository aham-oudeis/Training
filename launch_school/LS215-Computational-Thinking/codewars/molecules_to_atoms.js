'use strict';

//doesn't work, but i wanted to keep a record of my attempt

/*
For a given chemical formula represented by a string, count the number of atoms of each element contained in the molecule and return an object (associative array in PHP, Dictionary<string, int> in C#, Map<String,Integer> in Java).

For example:

var water = 'H2O';
parseMolecule(water); // return {H: 2, O: 1}

var magnesiumHydroxide = 'Mg(OH)2';
parseMolecule(magnesiumHydroxide); // return {Mg: 1, O: 2, H: 2}

var fremySalt = 'K4[ON(SO3)2]2';
parseMolecule(fremySalt); // return {K: 4, O: 14, N: 2, S: 4}

As you can see, some formulas have brackets in them. The index outside the brackets tells you that you have to multiply count of each atom inside the bracket on this index. For example, in Fe(NO3)2 you have one iron atom, two nitrogen atoms and six oxygen atoms.

Note that brackets may be round, square or curly and can also be nested. Index after the braces is optional.


                        Problem
--------------------------------------------------------------
Input:
Output:

Rules:

                      Clarifications:
--------------------------------------------------------------
Bad Inputs:
Edge Cases:

                        Examples
--------------------------------------------------------------
var fremySalt = 'K4[ON(SO3)2]2';

                        Data Structure
--------------------------------------------------------------
hashes
recursive nature of the parentheses and brackets
f(K4[ON(SO3)2]2)
f(K4) + f([ON(SO3)2]2)
f(K4) + f(ON(SO3)2) * 2
f(k4) + (f(ON) + f(SO3)2) * 2

                       Algorithm
--------------------------------------------------------------
 {s: 1, O: 3}
 number is 2
 {s: 2, O: 6}

*/

function parseOne(molecule) {
  let count = {};

  let atoms = molecule.match(/[A-Z][a-z]?\d*/g);

  atoms.forEach(atom => {
    let matchNum = atom.match(/\d+/);
    let number = matchNum ? parseInt(matchNum[0]) : 1;
    let element = atom.match(/[A-Z][a-z]?/)
    count[element] = number;
  });

  return count;
}

function multiplyValues(obj, num) {
  for (let key in obj) {
    obj[key] *= num;
  }

  return obj;
}

function merge(obj1, obj2) {
  let newObj = {...obj1};

  for (let key in obj2) {
    if (newObj[key]) {
      newObj[key] += obj2[key];
    } else {
      newObj[key] = obj2[key];
    }
  }

  return newObj;
}

function parseMolecule(molecule) {
  let layer = molecule.match(/(((\(.*\))|(\[.*\]))(\d*))/);

  if (layer) {
    let newLayer = (layer[2]).slice(1, -1);
    let number = parseInt(layer[5]) || 1;

    console.log(newLayer, number);

    let remaining = molecule.replace(newLayer, '');
    let firstObj = parseOne(remaining);
    let secondObj = multiplyValues(parseMolecule(newLayer), number);

    return merge(firstObj, secondObj);
  } else {
    return parseOne(molecule);
  }
}

var fremySalt = 'K4[ON(SO3)2]2';
console.log(parseMolecule(fremySalt));


