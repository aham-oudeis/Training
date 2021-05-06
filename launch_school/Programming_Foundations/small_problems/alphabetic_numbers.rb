eng_nums = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

nums = (0..19).to_a

paired_arr = eng_nums.zip(nums)

p paired_arr.sort.map {|set| set[1]}
