## Asynchronous Execution
### Sequential Code
### Asynchronous Code
`setTimeout`  is a function that takes two arguments: a callback function and a time to wait specified in miliseconds (1 sec = 1000 miliseconds).

```javascript
setTimeout(() => {
	console.log('!');
}, 3000);

setTimeout(() => {
	console.log('World');
}, 1000);

console.log('Hello')

//first prints 'Hello'
//then prints 'World' (approx 1 second later)
//finally prints '!' (approx 2 seconds later)
```

Reasoning about asynchronous code requrires knowing not only __what__ the code does but also __when__ it does it.

```javascript
function delayLog() {
	for (let i = 1; i < 11; i++) {
		setTimeout(() => console.log(i), i * 1000);
	}
}
```


## Repeating Execution with `setInterval`
```javascript
let id = setInterval(() => console.log('hello'), 2000);

//it logs 'hello' every 2 seconds untill the interval is cleared

clearInterval(id);
```

When the `setInterval` is invoked, it returns a value that identifies the timer. This identifier can be passed to `clearInterval` to remove the timer.

A helpful usecase for `setInterval` can be thought of as autosaving some form.

```javascript
let countId;

function startCounting() {
	let count = 1;
	countId = setInterval(() => console.log(count++), 1000);
}

function stopCounting() {
	clearInterval(countId);
}
```


## User Interfaces and Events

An __event__ is an object that represents some occurrence; it contains information about what happened and where it happened. The browser can trigger events as the page loads, as the user interacts with the page, or as the browser performs some action required by the program.

Code within user interface has two main tasks:
1. Set up the user interface and display it (HTML)
2. Handle events resulting from user or browser actions (Javascript)

_Event Listener_ is the code that the browser runs in response to the event.

### Page Lifecycle events
There is more to loading a page than just displaying the HTML. 

![[Pasted image 20220601200147.png]]

Since the javascript code runs before the browser processes the HTML and creates the DOM, any javascript that needs to use the DOM must wait until it becomes available.

The `load` event fires much later and hence is not particularly useful in most circumstances.

[[User Events and Listeners]]














