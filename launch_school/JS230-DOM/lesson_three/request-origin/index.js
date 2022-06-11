'user strict';

function getAreasOfContinents() {
  let xhr = new XMLHttpRequest();

  xhr.addEventListener('load', () => {
    console.log('Areas of continetns received!');
    console.log(xhr.response);
  });

  xhr.responseType = 'json';
  xhr.open('GET', 'http://localhost:3000/areas_of_continents');
  xhr.send();
}
