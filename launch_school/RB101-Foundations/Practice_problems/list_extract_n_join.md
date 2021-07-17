Given: an array containing hashes of names

Return: a string formatted as a list of names separated by commas  except for the last two names, which should be separated by an  ampersand.

### Problem

Input: an array containing hashes of names; each element is a hash and has a key `:name`

output: a string concataned according to the following rules:

	1. The last two elements are joined together with `&`
 	2. Other elements are joined together with `,\s`.

Clarifications:

1. Do the hashes contain only `:name` or can they contain other keys as well?
2. Can we have an empty array: yes.

Data Structure and Algorithm:

1. If the array is empty, return an empty string. 
2. Transform the array as follows:
   1. for each element, take the element and extract the value assigned to the key `:name`
   2. use that value to make a new array with only the names.
3. once you have the array with names, join them as follows:
   1. if the array size is 1, return the element.
   2. if the array size is 2, contact the elements with `&`
   3. if the array size is > 2, then extract the last elements and join them according to num. 2
4. return the string

```ruby
def list(arr)
  return '' if arr.empty?
  
  list_of_names = arr.map {|i| i[:name]}
  
  if list_of_names.size == 1
   	list_of_names.first
  else
    list_of_names[0..-2].join(', ') + ' & ' + list_of_names[-1]
  end
end
```



Example:

```ruby
list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'

list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'

list([ {name: 'Bart'} ])
# returns 'Bart'

list([])
# returns ''

```

