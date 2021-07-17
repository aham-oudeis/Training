=begin
Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

**Problem**
-input: Array
-output: sorted Array

Requirements:
-the caller has to be mutated
-the original array is returned

Algorithm: [3, 2, 1, 7]
1. take the first array item and compare it with the next
2. if the first is smaller, go to the next step
3. if the first is larger, switch places of the two items [2, 3, 1, 7]
4. take the next array item and compare it with the next + 1
5. follow 2-4 [2, 1, 3, 7]
6. repeat till the index is -1. [2, 1, 3, 7]
7. start at index 0 and repeat 1-6.
8. [1, 2, 3, 7]
9. if there is no switching on that round, end the loop
10. return the array
=end

def bubble_sort!(arr)
  last_idx = arr.size - 1

  loop do
    start_idx = 0
    switches = 0

    loop do
      if arr[start_idx] > arr[start_idx + 1]
        arr[start_idx], arr[start_idx + 1] = arr[start_idx + 1], arr[start_idx]
        switches += 1
      end

      start_idx += 1
      break if start_idx == last_idx
    end

    last_idx -= 1

    return arr if switches == 0
  end
end

sample = [1, 8, 9, 10]
p bubble_sort!(sample)
p sample

p array_1 = [6, 2, 7, 1, 4]
p bubble_sort!(array_1)
p array_1 == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)