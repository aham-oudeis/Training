function greetings(arr, obj) {
  let name = arr.join(' ');
  console.log(`Hello, ${name}! Nice to have a ${obj.title} ${obj.occupation} around.`);
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// console output
//Hello, John Q Doe! Nice to have a Master Plumber around.
