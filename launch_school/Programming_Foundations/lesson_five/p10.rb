=begin
Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.
=end

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

add_one = proc {|k, v| [k, v += 1]}

p arr.map {|hash| hash.map(&add_one).to_h}

=begin
first map call maps according to the following:
{a: 1}                  => {a: 1}.map {|k, v| [k, v += 1]}
{b: 2, c: 3}            => {b: 2, c: 3}.map {|k, v| [k, v += 1]}
{d: 4, e: 5, f: 6}      => {d: 4, e: 5, f: 6}.map {|k, v| [k, v += 1]}

the second map call, say {b: 2, c: 3}.map {|k, v| [k, v += 1]}, does the following

k = b, v = 2

v = v + 1

[k, v]

and for each key-value pair it only returns the value, not the key

This process just returns a nested array and not the hash contained within the array

then each nested array can be transformed to a hash and the outer map loop uses it
=end

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

p (arr.map do |hash|
  hash.each_with_object({}) do |(k, v), hash|
    hash[k] = v + 1
  end
end)
