
def print_in_box(str)
  length = str.length + 2
  border = '+' + ('-' * length) + '+'
  empty_line = '|' + (' ' * length) + '|'
  
  puts border
  puts empty_line
  puts "| #{str} |"
  puts empty_line
  puts border
end

# print_in_box('To boldly go where no one has gone before.')

=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end
MARGIN_ALLOWED = 80
PADDING = 4 # 2 on each side of the text
MARGIN_CONSTANT = MARGIN_ALLOWED - PADDING

def wrap(msg)
  length = msg.length
  # horizontal_lines = 1 + length / line_margin
  line_adjusted_msg = ''
  line_margin = MARGIN_CONSTANT
  start_index = 0
  loop do
    line_msg = msg[start_index..line_margin].strip

    puts "| " + line_msg.ljust(MARGIN_CONSTANT) + " |"

    break if line_margin > length
    line_adjusted_msg << "\n"
    start_index = line_margin + 1
    line_margin += MARGIN_CONSTANT
  end
end

def print_in_box_wordwrap(msg)
  length = msg.length
  
  if length < MARGIN_CONSTANT
    pad_length = length + 2 
  else 
    pad_length = MARGIN_CONSTANT + 2 
  end
  
  border = '+' + ('-' * pad_length) + '+'
  empty_line = '|' + (' ' * pad_length) + '|'

  puts border
  puts empty_line
  wrap(msg)
  puts empty_line
  puts border
end

puts print_in_box_wordwrap("Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.")