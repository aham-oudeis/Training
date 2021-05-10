arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}


p arr1[1][1]
p arr2[2]
p hsh1[:first][2][0]
p hsh2[['a']][:a][2]


arr1[1][1] += 1

arr2[2] += 1

hsh1[:first][2][0] += 1

hsh2[['a']][:a][2] += 1

p arr1[1][1]
p arr2[2]
p hsh1[:first][2][0]
p hsh2[['a']][:a][2]
