```ruby
=begin
The Fibonacci numbers are the numbers in the following integer sequence (Fn):

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, ...

such as

    F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.

Given a number, say prod (for product), we search two Fibonacci numbers F(n) and F(n+1) verifying

    F(n) * F(n+1) = prod.

Your function productFib takes an integer (prod) and returns an array:

[F(n), F(n+1), true].

If you don't find two consecutive F(n) verifying F(n) * F(n+1) = prod
you will return

[F(n), F(n+1), false]

F(n) being the smallest one such as F(n) * F(n+1) > prod.

Some Examples of Return:

productFib(714) == [[21, 34], true] 
# # since F(8) = 21, F(9) = 34 and 714 = 21 * 34

productFib(800) == [[34, 55], false]
# since F(8) = 21, F(9) = 34, F(10) = 55 and 21 * 34 < 800 < 34 * 55

Problem
Input: an integer
output: a nested array with first element two consequetive fibonnaci numbers and the last element is a boolean that says whether or the two fibonacci numbers yield the product given as an integer

Rules:
1. the first element of the result array has to be the fibonacchi numbers that give the closest product to the given integer. 
2. the product has to be either equal to the given integer or the product has to be greater than.
3. the first element of the fib series is 0. 

Example
productFib(714)

say the first number is 1
and the second number is also 1

first number = 1
second number = 1 + 1

first number = n  
second number = m

n * m >= 714

[n, m]
test if product of [n, m] is equal to 714


Algorithm
1. initialize two variables 'first_num' and 'second_num' to 1, 1.
2. start a loop
3. reassign first_num to second_num and the second_num to the sum of first_num and second_num
4. break the loop when first_num * second_num >= given integer
5. test if first_num * second_num is equal to the given integer
6. if yes, then return [[first_num , second_num], true]
7. else, return [[first_num , second_num], false]
=end



def productFib(int)
    first_num, second_num = 1, 1
    
    loop do
        first_num, second_num = second_num, first_num + second_num
        break if first_num * second_num >= int
    end
    
    boolean = first_num * second_num == int
    
    [[first_num, second_num], boolean]
end

p productFib(714)
p productFib(800)

```

