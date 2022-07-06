'use strict';

document.addEventListener('DOMContentLoaded', (first) => {
	let addItemForm = document.body.querySelector('#details');
	let form = document.body.querySelector('form');
	let itemName = form.querySelector('#item-name');
	let quantity = form.querySelector('#quantity');
	let groceries = document.querySelector('#groceries');

	const addListItem = (name, quantity) => {
		let listItem = document.createElement('li');
		listItem.textContent = `${quantity} ${name}`;

		groceries.appendChild(listItem);
	};

	const clearInputArea = () => {
		itemName.value = '';
		quantity.value = '';
	};

	form.addEventListener('submit', (event) => {
		event.preventDefault();

		addListItem(itemName.value, +quantity.value || 1);
		clearInputArea();
	});
}); 
