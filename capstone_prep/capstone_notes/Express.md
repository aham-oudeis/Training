## Node.js and Express
- Since browsers don't support some of the newest feature of JS, the code running in the browser must be __transpiled__ with e.g. babel.
- while browsers use ES6 modules, node.js uses CommonJS modules
	- Node ecosystem had a need for modules long before JS supported them in the language specification

```javascript
'use strict';

const http = require('http')

const app = http.createServer((request, response) => {
  response.writeHead(200, {'Content-Type': 'text/plain' })
  response.end('Hello World')
})

const PORT = 3001
app.listen(PORT)
console.log(`Server running on port ${PORT}`)

```

Here the `createServer` creates a new server and the function passed to it is the event handler. This event handler gets triggered every time a request comes through. When a request comes in, the callback function is triggered. Inside the function, the response is crafted with `writeHead` and `end` method. The `end` method dispatches the response back to where the request is coming from.

### Steps for starting an express server
1. `npm init`
2. Fill out the details that npm asks for
3. revise the package.json file and add `"start": "node index.js"` inside of the `scripts`
4. `npm install express`
5. `npm install` installs all dependencies, if any
6. `npm install --save-dev nodemon` nodemon restarts the server when there are any changes to the file, but the dependency is installed only for development and not for production
7. add `"dev": "nodemon index.js"` this adds a command that we can use to start a server with `nodemon` using a shorthand `npm run dev`

### Middleware
Middleware are functions that can be used for handling _request_ and _response_ objects.

Middleware functions are called in the order that they're taken into use with the express server object's _use_ method. Notice that json-parser is taken into use before the _requestLogger_ middleware, because otherwise _request.body_ will not be initialized when the logger is executed!

Middleware functions have to be taken into use before routes if we want them to be executed before the route event handlers are called. There are also situations where we want to define middleware functions after routes. In practice, this means that we are defining middleware functions that are only called if no route handles the HTTP request.

### Steps to Integrate backend and frontend
1. Prepare the files for heroku:
			1. create  a Procfile with the following content: `web: node index.js`
2. Change the PORT info as follows: 
```javascript
const PORT = process.env.PORT || 3001
app.listen(PORT, () => {
	console.log(`server running on port #{PORT}`)
})
```
3. make the directory a git repository and add a .gitignore file to ignore `node_modules` (bc they are heavier than the solar system)

![[Pasted image 20220719185712.png]]

