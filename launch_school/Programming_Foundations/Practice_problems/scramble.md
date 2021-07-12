scramble

```ruby
def scramble(str1, str2)
  str2.chars.uniq.all? { |i| str1.count(i) >= str2.count(i)}
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
```

