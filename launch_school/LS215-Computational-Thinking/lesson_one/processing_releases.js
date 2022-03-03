let newReleases = [
  {
    'id': 70111470,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 675465,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
];

// The Function should generate an Array of Objects that contain only the id and title key/value pairs. You may assume that id and title, when existing, is an integer greater than 0 and non-empty string respectively. Here are the rules:
//  Keep only releases that have both id and title property present.
//  Keep only the id and title data for each release.
//
// Pseudocode
// initialize an empty array 'collection'
// iterate through the array
// pass each object to the callback function that checks if the object has both id and title
// if it does, then create a new object with those id and title and append it to a collection
// return the collection

let selectedReleases = [];

newReleases.forEach(obj => {
  //assuming that id won't be zero
  //otherwise, !!(((obj.id === 0) || obj.id) && obj.title)
  let hasIdAndTitle = !!(obj.id && obj.title);

  if (hasIdAndTitle) {
    let selected = { id: obj.id, title: obj.title };
    selectedReleases.push(selected);
  };
});

console.log(selectedReleases);

function processReleaseData(data) {
  const hasIdAndTitle = objItem => !!(objItem.id && objItem.title);

  let selected = data.filter(hasIdAndTitle);

  return selected.map(objItem => {
    return {id: objItem.id, title: objItem.title};
  });
}
