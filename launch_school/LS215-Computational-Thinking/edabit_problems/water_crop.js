/*
starting time: 12:43

You're given a 2D array / matrix of a crop field. Each crop needs to be hydrated. Each water source hydrates the 8 tiles around it. With "w" representing a water source, and "c" representing a crop, is every crop hydrated?


cropHydrated([
  [ "c", "c", "c", "c" ],
  [ "w", "c", "c", "c" ],
  [ "c", "c", "c", "c" ],
  [ "c", "w", "c", "c" ]
]) === false

is there a c that is not 1 distance from w?

Approach:
-iterate through the indices i
-iterate through the indices j
- i and j pick out each element
- check if there is a water source in the matrix starting from i - 1 and going up to 1 + 1

Helpter function
-take the indices value and slice the matrix accordingly
  --lets say i am iterating at [0, 2]
  --[0, 1] - [0, 2 ] [0, 3] [1, 1], - [1, 3]
  --join and do string matching
-start an outer iteration starting at the i - 1 value gpong upto i + 1
-start another iteration starting at j - 1 and going upto j + 1
-collect the elements in a string

index of 'w' => [1, 0], [3, 1]
covers the crop between [0, 1], [2, 2]

*/
function cropHydrated(matrix) {
  function oneDepthString(outer, inner) {
    let str = '';

    let bottomOuter = outer - 1 < 0 ? 0 : outer - 1;
    let topOuter = outer + 1 >= matrix.length ? outer : outer + 1;
    let bottomInner = inner - 1 < 0 ? 0 : inner - 1;
    let topInner = inner + 1 >= matrix[0].length ? inner : inner + 1;

    for (let i = bottomOuter; i <= topOuter; i++) {
      for (let j = bottomInner; j <= topInner; j++) {
        str += matrix[i][j];
      }
    }

    return str;
  }


  const waterSource = (string) => /w/.test(string);

  for (let i = 0; i < matrix.length; i++) {
    for (let j = 0; j < matrix[i].length; j++) {
      if (!waterSource(oneDepthString(i, j))) {
        return false;
      }
    }
  }

  return true;
}

console.log(cropHydrated([
  [ "w", "c" ],
  [ "w", "c" ],
  [ "c", "c" ]
]) === true)

console.log(cropHydrated([
  [ "c", "c", "c" ]
]) === false)
// There isn"t even a water source.

console.log(cropHydrated([
  [ "c", "c", "c", "c" ],
  [ "w", "c", "c", "c" ],
  [ "c", "c", "c", "c" ],
  [ "c", "w", "c", "c" ]
]) === false)
