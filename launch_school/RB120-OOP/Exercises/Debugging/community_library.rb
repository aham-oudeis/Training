# class Library
#   attr_accessor :address, :phone, :checked_items

#   def initialize(address, phone)
#     @address = address
#     @phone = phone
#     @checked_items = []
#   end

#   def check_out(book)
#     checked_items.push(book)
#   end
# end

# class Book
#   attr_accessor :title, :author, :isbn

#   def initialize(title, author, isbn)
#     @title = title
#     @author = author
#     @isbn = isbn
#   end

#   def display_data
#     puts "---------------"
#     puts "Title: #{title}"
#     puts "Author: #{author}"
#     puts "ISBN: #{isbn}"
#     puts "---------------"
#   end
# end

# community_library = Library.new('123 Main St.', '555-232-5652')
# learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
# little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
# wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

# community_library.check_out(learn_to_program)
# community_library.check_out(little_women)
# community_library.check_out(wrinkle_in_time)

# community_library.checked_items.map(&:display_data)

# the main issue is that we were calling the display_data method on an array object, but we have defined the method only for the Book object. So, we need to call the method display_data on the Book objects that populate the array returned by community_library.checked_items. We can do that by either calling each or map method.

=begin
suppose we want to build the idea that a checked book is timed so that the
person who checked out the book would have to return the book in time.
We would also want to have the abililty to find for any given person what the the items that are due soon. How would we build these functionalities?
=end

require 'date'

class LibraryMember
  attr_accessor :name, :address, :phone, :checked_items

  def initialize(name, address, phone)
    @name = name
    @address = address
    @phone = phone
    @checked_items = []
  end

  def check_out(token)
    timed_item = LibraryItem.new(token)
    checked_items.push(timed_item)
  end

  def return(token)
    checked_items.delete_if  { |library_item| library_item.item == token  }
  end
end

class LibraryItem
  attr_accessor :item, :checked_out_date, :return_date

  def initialize(item)
    @item = item
    @checked_out_date = Date.today
    @return_date = @checked_out_date + 60
  end

  def renew
    @return_date += 60
  end

  def info
    item.display_data
    puts "Checked Out: #{checked_out_date}"
    puts "Return Date: #{return_date}"
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

ruby_blondell = LibraryMember.new("Ruby Blondell", '123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

ruby_blondell.check_out(learn_to_program)
ruby_blondell.check_out(little_women)
ruby_blondell.check_out(wrinkle_in_time)

ruby_blondell.checked_items.each(&:info)

puts
puts "Some days have passed"
puts

ruby_blondell.return(little_women)
ruby_blondell.return(wrinkle_in_time)

ruby_blondell.checked_items.each(&:info)
