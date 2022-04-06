'use strict';

let chile = {
  name: 'The Republic of Chile',
  continent: 'South America',
  getDescription() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

let canada = {
  name: 'Canada',
  continent: 'North America',
  getDescription() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

let southAfrica = {
  name: 'The Republic of South Africa',
  continent: 'Africa',
  getDescription() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

function makeCountry(name, continent) {
  return {
    name,
    continent,
    getDescription() {
      return this.name + ' is located in ' + this.continent + '.';
    },
  }
}

chile = makeCountry('The Republic of Chile', 'South America');

//altering the factory function to add the visited property
function makeCountry(name, continent, visited = false) {
  return {
    name,
    continent,
    visited,

    getDescription() {
      return this.name + ' is located in ' + this.continent + '.' 'I ' +
        (visited ? 'have': "haven't") + ' visited ' + this.name + '.';
    },

    visitCountry() {
      this.visited = true;
    },
  }
}


