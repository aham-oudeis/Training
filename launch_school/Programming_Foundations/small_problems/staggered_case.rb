# def staggered_case(str, first='up')
#   staggered_str = ''
   
#   to_staggered_case = proc do |element, index| 
#     option = (first == 'up' ? index.even? : index.odd?)
#     if option 
#       staggered_str << element.upcase
#     else
#       staggered_str << element.downcase
#     end
#   end

#   str.chars.each_with_index(&to_staggered_case)

#   staggered_str
# end

def staggered_case(str, first='up')
    staggered_str = ""
    count = 0
    bool = (first == 'up' ? true : false)
    
    loop do
      char_is_alphabet = ('a'..'z').include?(str[count].downcase)

      if char_is_alphabet
        if bool
          staggered_str << str[count].upcase
          bool = !bool
        else
          staggered_str << str[count].downcase
          bool = !bool
        end
      else
        staggered_str << str[count]
      end

      count += 1
      break if count == str.length
    end

    staggered_str
  end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'