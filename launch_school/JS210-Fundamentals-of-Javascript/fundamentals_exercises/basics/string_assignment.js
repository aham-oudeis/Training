const name = 'Bob';
const saveName = name;
name.toUpperCase();
//here the method `toUpperCase` is invokedd on the string referenced by `name` constant
//this returns `BOB` but does not mutate the string (strings are immutaable in JS);
console.log(name, saveName);
