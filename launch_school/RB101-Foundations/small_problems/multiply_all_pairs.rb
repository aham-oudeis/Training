def multiply_all_pairs(arr1, arr2)
  final_arr = []
  arr1.each do |item|
    arr2.each do |element|
      final_arr << item * element
    end
  end
  final_arr.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
