# def max_by(arr)
#   conversion =
#     arr.each_with_object({}) do |item, object|
#       object[yield(item)] = item
#     end
#   max_value = conversion.keys.max
#   conversion[max_value]
# end

def max_by(arr)
  return arr.first if arr.size < 2

  max_value = arr.first

  arr.each_with_index do |item, index|
    value = yield(item)
    next_item = arr[index + 1]
    return max_value unless next_item

    next_value = yield(next_item)
    max_value =  item if value >= next_value
  end
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3,4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil