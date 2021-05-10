=begin
Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.
=end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# p (arr.map do |nest_arr| 
#     {nest_arr[0] => nest_arr[1]}
#   end)

# i was thinking of converting inner arrays into hashes
# wasn't thinking of converting the outer arry into a hash
# below is a code for converting the array into a hash

p (arr.each_with_object({}) do |nest_arr, hash|
  hash[nest_arr[0]] = nest_arr[1]
end)

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}