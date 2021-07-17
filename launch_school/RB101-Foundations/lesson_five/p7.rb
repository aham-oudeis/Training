a = 2
b = [5, 8]
arr = [a, b]

a += 2
arr[1][0] -= a

=begin
1. a points to integer 2
2. b points to an array [5, 8]
3. arr points to an array containing two pointers a and b
4. the value of arr[0] is incremented by 2 and reassigned to arr[0]
5. similarly, the value of arr[1][0], i.e., b[1] is reassigned to 8 - a.
6. step 4 is crucial here. 
7. since both arr[0] and a point to the same integer object, changing one should change the other.
8. but that depends on whether the pointers are related
9. since you can't actually change the integer object, you can only point to a different object. 
10. this will be my test: i think a keeps pointing to 2 although arr[0] points to something else.
11. however, arr[1] and b both point to the same array object.
12. by reassigning the value of arrr[1][0], we thus change the value of b
13, while a retains its original values 2, b changes from [5, 8] to [3, 8]
14. There seems to be an important difference between integer object and other immutable objects. 
=end


p a

p b

p arr