# def one?(collection)
#   total = []
#   collection.each { |item| total << item if yield(item)}
#   total.size == 1
# end

def one?(collection)
  only_one = false
  collection.each do |item|
    next unless yield(item)
    return false if only_one
    only_one = true
  end
  only_one
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false