```ruby
=begin
John and Mary want to travel between a few towns A, B, C ... Mary has on a sheet of paper a list of distances between these towns. ls = [50, 55, 57, 58, 60]. John is tired of driving and he says to Mary that he doesn't want to drive more than t = 174 miles and he will visit only 3 towns.
Which distances, hence which towns, they will choose so that the sum of the distances is the biggest possible to please Mary and John?
Example:
With list ls and 3 towns to visit they can make a choice between: [50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60].
The sums of distances are then: 162, 163, 165, 165, 167, 168, 170, 172, 173, 175.
The biggest possible sum taking a limit of 174 into account is then 173 and the distances of the 3 corresponding towns is [55, 58, 60].
The function chooseBestSum (or choose_best_sum or ... depending on the language) will take as parameters t (maximum sum of distances, integer >= 0), k (number of towns to visit, k >= 1) and ls (list of distances, all distances are positive or zero integers and this list has at least one element). The function returns the "best" sum ie the biggest possible sum of k distances less than or equal to the given limit t, if that sum exists, or otherwise nil, null, None, Nothing, depending on the language.
With C++, C, Rust, Swift, Go, Kotlin, Dart return -1.
Examples:
ts = [50, 55, 56, 57, 58] choose_best_sum(163, 3, ts) -> 163
xs = [50] choose_best_sum(163, 3, xs) -> nil (or null or ... or -1 (C++, C, Rust, Swift, Go)
ys = [91, 74, 73, 85, 73, 81, 87] choose_best_sum(230, 3, ys) -> 228
Note:
don't modify the input list ls

p choose_best_sum(174, 3, [50, 55, 57, 58, 60]) == 173 
p choose_best_sum(163, 3, [50, 55, 56, 57, 58]) == 163
p choose_best_sum(163, 3, [50]) == nil
p choose_best_sum(230, 3, [91, 74, 73, 85, 73, 81, 87]) == 228
=end

Problem
Input: two integer and an array
  where, the first integer is the limit distance
        the seecond integer is the number of towns(elements)
        the third array is the list of distances between towns.
Return: The largest sum of given number of elements from the list such that the sum is <= the given limit

Examples:
p choose_best_sum(174, 3, [50, 55, 57, 58, 60]) == 173 
p choose_best_sum(163, 3, [50, 55, 56, 57, 58]) == 163
p choose_best_sum(163, 3, [50]) == nil
p choose_best_sum(230, 3, [91, 74, 73, 85, 73, 81, 87]) == 228

Components
* find combination of the given number (towns) from the list(arr)
* take the num  of each nested array
* select the ones that are equal or smaller than the limit
* find the maximum value from it.

Algorithm
* return nil if the size of the list is smaller than the number of towns
* take the combination of the list with the given number of towns passed in
* transform the elements by taking the  sum of the numbers in each nested array
* select the ones that are equal to or smaller than the limit provided
* call the max method on that selected elements.

=end

def choose_best_sum(limit, towns, list)
  return nil if towns > list.size
  sums = list.combination(towns).to_a.map(&:sum)
  sums.select {|distances| distances <= limit}.max
end

p choose_best_sum(174, 3, [50, 55, 57, 58, 60]) == 173 
p choose_best_sum(163, 3, [50, 55, 56, 57, 58]) == 163
p choose_best_sum(163, 3, [50]) == nil
p choose_best_sum(230, 3, [91, 74, 73, 85, 73, 81, 87]) == 228
```

