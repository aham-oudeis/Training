# def validBraces(braces)
#   stack = []
#   index = 0
#   hsh_match = {"["=>"]", "{"=>"}", "("=>")" }

#   braces.each_char do |half_brace|
#     if hsh_match.keys.include?(half_brace)
#       stack.push(half_brace)
#     else
#       stack.pop if hsh_match[stack.last] == half_brace
#       stack.push(half_brace)
#     end
#   end
#   stack.empty?
# end

def validBraces(braces)
  stack = []
  hsh_match = {"["=>"]", "{"=>"}", "("=>")" }

  braces.each_char do |half_brace|
    (half_brace == hsh_match[stack.last]) ?
      stack.pop : stack.push(half_brace)
  end

  stack.empty?
end

p validBraces( "[{()}]" )