=begin
Write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block variables in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.
=end


sample_array = %w(birds bats dogs cats snakes)

# def pass_params(arr)
#   first, second, *remaining = arr
#   yield(remaining)
# end

# pass_params(sample_array) { |pets| p pets}


def pass_params(arr)
  yield(arr)
end

pass_params(sample_array) { |_, _, *pets| p pets }


