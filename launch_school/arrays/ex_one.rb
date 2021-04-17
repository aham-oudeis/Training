=begin
some common methods: 
.first, .last, .pop(), .push(), .detele(), 
.detele_at(), .unshift(), .each, .map, .collect
.uniq, .select, .flatten, .to_s
.each_index, .each_with_index, .include?, .product()
=end

# practice with arrays

# question 1

# arr = [1, 3, 5, 7, 9, 11]
# number = 3

# puts arr.include?(number) 

# question 2

# the first program should return 1 
# bc 1 is removed by the method
# I was expecting the value of arr to remain the same
# but turns out it mutates the caller
# and returns [["b"],["b", 2],["b", 3],["a", 1],["a", 2],["a", 3]]
# second program creates an array within an array
arr = ["b", "a"]

# makes an array [1, 2, 3] and uses product method on 
# the arr and stores it in arr again

#arr = arr.product(Array(1..3))     # first program
arr = arr.product([Array(1..3)])    # second program

# takes the first item in the arry ["b", 1]
# and deletes the last item from ["b", 1]
p arr.first.delete(arr.first.last) 

p arr
