### Select 

```ruby
# using recursion

def select_helper(arr, collection, &b)
  if arr.empty?
    collection
  else 
    collection += (b.call(arr.first) ? [arr.first] : [])
    arr = arr[1..-1]
    select_helper(arr, collection, &b)
  end
end

def select(arr, &b)
  select_helper(arr, [], &b)
end

p select (1..10).to_a, &:odd?
```