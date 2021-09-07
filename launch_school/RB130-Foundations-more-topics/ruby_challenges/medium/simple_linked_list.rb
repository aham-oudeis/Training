# I make use of an array to store all the elements, but the question actually requires
# that I don't use array to store, but make use of the next to make list-like structure
# howevever, the logic of doing that should not be that tricky; will do that as a
# further exploration.

# class Element
#   attr_reader :datum, :next

#   def initialize(datum, next_el=nil)
#     @datum = datum
#     @next = next_el
#   end

#   def tail?
#     @next.nil?
#   end

#   def next=(el)
#     @next = el
#   end
# end

# class SimpleLinkedList
#   def initialize(*list)
#     @list = []
#     create_linked_elements(list)
#   end

#   def self.from_a(data)
#     data ? new(*data.reverse) : new()
#   end

#   def head
#     @list[-1]
#   end

#   def size
#     @list.size
#   end

#   def peek
#     head ? head.datum : nil
#   end

#   def empty?
#     @list.empty?
#   end

#   def push(item)
#     last_element = @list[-1]
#     new_elment = Element.new(item, last_element)
#     @list.push(new_elment)
#   end

#   def pop
#     @list.pop.datum
#   end

#   def reverse
#     new_data = to_a
#     SimpleLinkedList.new(*new_data)
#   end

#   def to_a
#     @list.map(&:datum).reverse
#   end

#   def create_linked_elements(list)
#     list.each { |item| push(item) }
#   end
# end

# Further Exploration (actually, correction)

class Element
  attr_reader :datum, :next

  def initialize(datum, next_el=nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end

  def next=(el)
    @next = el
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize(*list)
    create_linked_elements(list)
  end

  def self.from_a(data)
    data ? new(*data.reverse) : new()
  end

  def size
    count = 0
    current_element = head

    while current_element
      count += 1
      current_element = current_element.next
    end

    count
  end

  def peek
    head.datum if head
  end

  def empty?
    head.nil?
  end

  def push(item)
    last_element = head
    new_elment = Element.new(item, last_element)
    @head = new_elment
  end

  def pop
    value = peek
    @head = head.next if head
    value
  end

  def reverse
    new_data = to_a
    SimpleLinkedList.new(*new_data)
  end

  def to_a
    array = []
    current_element = head
    while current_element
      array << current_element.datum
      current_element = current_element.next
    end
    array
  end

  def create_linked_elements(list)
    list.each { |item| push(item) }
  end
end
