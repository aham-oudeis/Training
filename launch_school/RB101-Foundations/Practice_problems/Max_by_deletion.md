=begin

Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

Example:
For n = 152, the output should be 52
For n = 1001, the output should be 101.
Constraints: 10 ≤ n ≤ 1000000.

Problem
-Input: integer
-output: integer
Rules:
1. the interger is between 10 and 1,000,000
2. find the biggest integer that can be formed by delete one digit
3. we don't get to rearrange the digits

Algorithm
1. initialize an empty array (collection) to collect all the variations of the integer
formed by deleting different index
2. convert the integer into an array (digits)
3. iterate through an array [0...digits.size]
4. make a copy of the digits and delete each index in each iteration.
5. join the deleted array and convert it into an integer
6. append the integer to the empty arrray (collection)
7. return the maximal value in the collection.
=end

def max_by_deletion(int)
  collection = []
  digits = int.to_s.chars

  (0...digits.size).each do |idx|
    copy = digits.dup
    copy.delete_at(idx)
    collection << copy.join.to_i
  end
  collection.max
end

p max_by_deletion(1001)