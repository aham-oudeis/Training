### Flux architecture
As the application grows more complex, managing the state of the application becomes a serious issue. Jam packing all the state initialization in the main app component is not feasible.

To deal with this, facebook dealt with this by designing flux architecture.

![[Pasted image 20220721124101.png]]

### `store.subscribe`
This is the method for executing a function any time some value in the store changes

One question I have is how to manage the state when there are multiple states to be managed.
