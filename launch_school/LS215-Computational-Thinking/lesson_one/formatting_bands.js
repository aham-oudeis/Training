
let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(data) {
  function capitalize(word) {
    let chars = [...word];
    chars[0] = chars[0].toUpperCase();

    return chars.join('');
  }

  function removePeriod(string) {
    return string.replace(/\./g, '');
  }

  function capitalizeWords(sentence) {
    return sentence.split(' ').map(capitalize).join(' ');
  }

  function alterBands(bandItem) {
    bandItem = {...bandItem};

    bandItem.country = 'Canada';
    bandItem.name  = capitalizeWords(removePeriod(bandItem.name))

    return bandItem;
  }

  return data.map(alterBands);
}

console.log(processBands(bands));
