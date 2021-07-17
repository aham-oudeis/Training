```ruby
=begin

Write a method that takes two arrays (arr1, arr2) that returns a new array with the difference between arr1 and arr2

Example 1:
arr1 = [1,2,3]
arr2 = [2,3]
p difference(arr1, arr2) == [1]
p arr1 == [1,2,3]

Example 2:
arr1 = [1,1,2,2,3]
arr2 = [2,3]
p difference(arr1, arr2) == [1,1,2]
p arr1 = [1,1,2,2,3]

Example 3:
arr1 = [3,2,1,2,3,4]
arr2 = [2,3]
p difference(arr1, arr2) == [1,2,3,4]
p arr1 = [3,2,1,2,3,4]

Problem
Input: two arrays
Output: an array containing the elements from the first array that are not present in the second array with one caveat:
  1. the number has to eliminate only once if the other array contains it once
  2. if the other array contains it twice and the element count in the first arrray is > 1, then substract that many. 

Rules
* do not change the order of the elements in the first array
* remove the repeat elements starting from the first time it comes up in the first array

Examples:
arr1 = [1,1,2,2,3]
arr2 = [2,3]

[1, 1 ] ---- [3]
[1, 1, 2] ---[]

arr1 = [3,2,1,2,3,4]
arr2 = [2,3]

Algorithm:
arr1 = [3,2,1,2,3,4]
arr2 = [2,3] => [2] => []
result = [1, 2, 3, 4]
* initialize a copy of both the given arrays
* initialize a result array to contain all the substracted elements
* iterate through the copy of the first array
* on each iteration do as follows:
  ** if the element is a member of the second array (copy), find the index of the element in the copy of the second array
  ** then delete at the index
  ** if the element is not a member of the second array(copy), then append that element to the result array
  
* by the end of the iteration, we should have the desired array
  
=end

def difference(arr1, arr2)
  arr2 = arr2.dup
  
  arr1.each_with_object([]) do |num, difference|
    if arr2.include?(num)
      index_of_num = arr2.index(num)
      arr2.delete_at(index_of_num)
    else
      difference << num
    end
  end 
end

def difference(arr1, arr2)
  arr1.uniq.each_with_object([]) do |item, collection|
    diff = arr1.count(item) - arr.count(item)
    diff = 0 if diff < 0
    diff.times {collection << item}
  end
end

arr1 = [1,2,3]
arr2 = [2,3]
p difference(arr1, arr2) == [1]
p arr1 == [1,2,3]

arr1 = [1,1,2,2,3]
arr2 = [2,3]
p difference(arr1, arr2) == [1,1,2]
p arr1 == [1,1,2,2,3]

arr1 = [3,2,1,2,3,4]
arr2 = [2,3]
p difference(arr1, arr2) == [1,2,3,4]
p arr1 == [3,2,1,2,3,4]
```

