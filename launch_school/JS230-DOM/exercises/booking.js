'use strict';

(function() {
	let request = new XMLHttpRequest();
	request.open('GET', 'http://localhost:3000/api/schedules');

	request.timeout = 5000;
	request.responseType = 'json';

	request.addEventListener('loadend', (event) => {
		console.log('The request has been completed: ${event}')
	});

	request.addEventListener('load', () => {
		let schedules = request.response;

		if (schedules.length < 1) {
			alert('There are no available schedules');
			return;
		};

		let count = {};
		schedules.forEach(schedule => {
			count[`staff ${schedule.staff_id}`] ||= 0;
			count[`staff ${schedule.staff_id}`] += 1;
		});

		console.table(count);
	});

	request.addEventListener('timeout', (event) => {
		alert('Your message has timedout! Please send the request again');
	})

	request.send();
/*
	setTimeout(() => {
		if (request.response) return;
		request.abort();
		alert('You will have to send the request again!')
	}, 5000)
*/
})();

//using fetch api

function timeoutFetch(url, timeout) {
	return new Promise((resolve, reject) => {
		let timeoutId = setTimeout(() => {
			reject(new Error('The request has timed out!'));
		}, timeout);

		fetch(url)
			.then(response => {
				clearTimeout(timeoutId);
				resolve(response);
			})
			.catch(err => {
				clearTimeout(timeoutId);
				reject(err)
			})
			.finally(alert('Your request has been completed'));
	});	
}

(function() {
	timeoutFetch('http://localhost:3000/api/schedules', 5000)
		.then(response => {
			console.log(response.json())
		});
})();


//add a staff member
(function() {
	let request = new XMLHttpRequest();
	request.open('POST', 'http://localhost:3000/api/staff_members');
}());
