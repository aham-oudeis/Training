I am a bit puzzled about example 7 from "Working with Blocks"

Here is the line of code:

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```

As I understand the code:
  1. sort_by method is called on arr
  2. the sort_by method assigns a local variable sub-arr to each item of arr
  3. each sub-arr calls map and returns an array of items with the elements converted from string to integer
  4. this returned array from 3 is used by sort_by method to sort the original array
  5. finally we get the sorted arr based on the intergers

I am puzzled about the step that connects 3 and 4. I suppose something about my mental model is inadequate. I can understand the following code: 

```ruby
arr.sort_by do |sub_arr|
  sub_arr[1]
  end
end
```

Here we are sorting by the second element of the sub_arr. This makes sense to me because the referred element is still a part of the original array arr. Since that which is sorted by, i.e. sub_arr[1], is simply a part of the original array, the sorting makes sense. 

However, if I were to put some random arry within the block, the sorting would return the original array. 

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
new_arr = [5, 3, 1, 5]

p (arr.sort_by do |sub_arr|
  new_arr
end)
```
I suppose that since the random array has no connection with the original array, the sort_by has no specified way of comparing elements.

The puzzle I have is this: what the **map** method returns seems more like a random array than some specified element from the original array. I am assuming that the **map** method returns a new transformed array. Presumably, what the **map** method returns is connected with the original array since it is called on an element of the original array. I am curious about how that connection is kept intact.

Given how I am reasoning about this, I might have a rather inadequate model for how sort_by works. I'd love any and every correction. 

Thank you!

`<p> map </p>`