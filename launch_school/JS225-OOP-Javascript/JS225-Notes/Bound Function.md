##  How `bind` might work

Here is how the bind method might be defined:

```js
Function.prototype.bind = function (...args) {
	// extract the first argument that is to be used as the value of this
	let thisArg = args.shift();
	
	//since functions are objects, calling a bind method on a function would 
	// set the value of this to the function object. we extract the function 
	// with the this keyword
	let funcToBeInvoked = this;
	
	return function (...rest) {
		//call the function with prefilled arguments and 
		//then the arguments that are passed 
		return funcToBeInvoked.call(thisArg, ...args, ...rest);
	}
}

```
