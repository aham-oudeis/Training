def drop_while(collection)
  start = nil
  collection.each_with_index do |item, index|
    next if yield(item)
    start = index
    break
  end

  start ? collection[start..-1] : []
end

def drop_while(collection)
  collection.each_with_index do |item, index|
    return collection[index..-1] unless yield(item)
  end

  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []