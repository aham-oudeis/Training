```ruby
=begin
5 kyu
=begin
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

domain_name("http://github.com/carbonfive/raygun") == "github" 
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"

Problem
input: a URL as a string
output: string with just the domain name

Components:
1. convert the string into characters
2. select the characters between ['www.', '://'] and '.' 
3. iterate through the characters and change the register to 'true' when the character reaches '.' or '/'
4. when the character is '/' and the register is 'true', skip
5. append the characters into the string untill the register is false
6. change the register to false when the character is '.' and the register is true.
=end
# works only for a limited number of cases provided.
def domain_name(str)
  register = false
  domain_name = ''
  chars = str.chars
  chars.each_with_index do |char, idx|
    if ['/', '.'].include?(char) && register == false
      if chars[idx+1..-1].match?(/[www]/)
        next
      else
      	register = true
      end
    elsif char == '/' && register == true
      next
    elsif char == '.' && register == true
      break
    elsif register == true
      domain_name << char
    end
  end
  domain_name
end
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"

# a better solution
def domain_name(str)
  str = str.gsub('http://', '')
  str = str.gsub('https://', '')
  str = str.gsub('www.', '')
  str.split('.').first
end
```

