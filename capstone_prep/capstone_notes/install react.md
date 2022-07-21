
```
npx create-react-app part1
```

- 1c and 1d  
- 2a, 2b, 2c and 2d  
- Part 3  
- Part 6  
- 7a and 7b
## React Concepts
### Component
The file `App.js` now defines a React component with the name __App__.

Components are just functions that  returns a jsx objects that are parsed by the babel engine under the hood.

The function defining the component may contain any kind of JS code.

### Stateful Component
When the state modifying function is called, React re-renders the component, which means that the function body of the component gets re-executed.

A bit puzzling part is that when the function body is executed, the `useState` function returns the updated value for the state. That is, it preserves the state of the component and returns that.

What I'm a bit puzzled about is how we can instantiate several state-modifying functions

![[Pasted image 20220716130650.png]]