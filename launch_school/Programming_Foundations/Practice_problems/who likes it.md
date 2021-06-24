```ruby
=begin
You probably know the "like" system from Facebook and other pages. People can "like" blog posts, pictures or other items. We want to create the text that should be displayed next to such an item.

Implement a function likes :: [String] -> String, which must take in input array, containing the names of people who like an item. It must return the display text as shown in the examples:

likes [] // must be "no one likes this"
likes ["Peter"] // must be "Peter likes this"
likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"

Problem
input: array
return: string
  Rules:
  1. if the array is empty, "no one likes this"
  2. if the array has one element, '[element] likes this'
  3. if the array has two elements, "[element1 and element2] like this"
  
Algorithm
1. if the array is empty. return "no one likes this"
2. elsif the array has one element, "#{element} likes this."
3. elsif the array has two elements, "#{element1} and #{element2} like this"
4. elsif the array has three elements, "#{element1}, #{elemet2}, and #{element3} like this"
5. else
  remaining number = array sze minus 2.
  "#(element1), #{element2} and #{remaining-number} others like this"

=end

def likes(arr)
  size = arr.size
  case size
  when 0
    "No one likes this."
  when 1
    "#{arr.first} likes this."
  when 2
    "#{arr.first} and #{arr.last} likes this."
  when 3
    "#{arr.first}, #{arr[1]} and #{arr.last} likes this."
  else
     "#{arr.first}, #{arr[1]} and #{size - 2} others likes this."
  end
end

p likes([]) #// must be "no one likes this"
p likes(["Peter"]) #// must be "Peter likes this"
p likes(["Jacob", "Alex"]) #// must be "Jacob and Alex like this"
p likes(["Max", "John", "Mark"]) #// must be "Max, John and Mark like this"
p likes(["Alex", "Jacob", "Mark", "Max"]) #// must be "Alex, Jacob and 2 others like this"

```

