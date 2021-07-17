# class Banner
#   attr_reader :message

#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def size
#     message.length
#   end

#   def horizontal_rule
#     "+-#{'-' * size}-+"
#   end

#   def empty_line
#     "| #{' ' * size} |"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# Further Exploration

class Banner
  attr_reader :message, :width

  def initialize(message, width=80)
    @message = message
    @width = adjusted(width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].flatten.join("\n")
  end

  private

  def adjusted(num)
    if (20..100).include?(num)
      num
    else
      puts "Invalid width. Width set to 60"
      60
    end
  end

  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    @message.chars.each_slice(width).map do |slices|
    "| " + slices.join.center(width) + " |"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 2)
puts banner