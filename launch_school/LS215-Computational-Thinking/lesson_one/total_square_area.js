function totalArea(rectangles) {
  const area = ([len, breadth]) => len * breadth;

  return rectangles.map(area).reduce((total, element) => total + element);
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

totalArea(rectangles);    // 141

function totalSquareArea(rectangles) {
  let squares = rectangles.filter(([length, breadth]) => length === breadth);

  return totalArea(squares);
}
