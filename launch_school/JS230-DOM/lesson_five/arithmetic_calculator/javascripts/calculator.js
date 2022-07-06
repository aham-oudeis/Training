'use strict';

//what do i have to do for this assignment?
document.addEventListener('DOMContentLoaded', (event) => {
	let showResult = document.querySelector('#result');
	let form = document.querySelector('form');

	const getValue = (selector) => form.querySelector(selector).value;

	const operatingFunctions = {
		add: function(num1, num2) {
			return num1 + num2;	
		},
		substract: function(num1, num2) {
			return num1 - num2;	
		},
		multiply: function(num1, num2) {
			return num1 * num2;	
		},
		divide: function(num1, num2) {
			return num1 / num2;	
		},
	};

	const conversion = (symbol) => {
		switch(symbol) {
			case '+': return operatingFunctions.add;
			case '-': return operatingFunctions.substract;
			case '*': return operatingFunctions.multiply;
			case '/': return operatingFunctions.divide;
		}
	}
	
	form.addEventListener('submit', (event) => {
		//get the text from the first operand
		//get the text from the second operand
		//get the text from the operator type
		//calculate the value and then change the textcontent of h1
		let num1 = getValue('#first-number');
		let num2 = getValue('#second-number');
		
		let todo = getValue('#operator');

		let operationFunc = conversion(todo);

		showResult.textContent = String(operationFunc(num1, num2));
	});
});
