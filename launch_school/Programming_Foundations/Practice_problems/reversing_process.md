```ruby
=begin
encode("mer", 6015)  -->  "6015ekx"

m --> 12,   12 * 6015 % 26 = 4,    4  --> e
e --> 4,     4 * 6015 % 26 = 10,   10 --> k
r --> 17,   17 * 6015 % 26 = 23,   23 --> x

So we get "ekx", hence the output is "6015ekx"

12 * 6015 divided by 26 has a remainder 4.
How do we extract 12 from this process?

Y = (26 * X + 4) / 6015
12	 = 

=end
```

