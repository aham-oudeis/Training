require 'date'

class Meetup
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(name, position)
    method_name = position.downcase.to_sym
    name = name.downcase + '?'
    send(method_name, name)
  end

  def first(name)
    find_day(name, 0)
  end

  def second(name)
    find_day(name, 7)
  end

  def third(name)
    find_day(name, 14)
  end

  def fourth(name)
    find_day(name, 21)
  end

  def fifth(name)
    fifth_day = find_day(name, 28)
    fifth_day.month == month ? fifth_day : nil
  end

  def teenth(name)
    find_day(name, 0, 13)
  end

  def last(name)
    start_date = Date.civil(year, month + 1)
    loop do
      start_date -= 1
      return start_date if start_date.send(name.to_sym)
    end
  end

  def find_day(name, offset, day = 1)
    start_date = Date.civil(year, month, day)
    loop do
      return (start_date + offset) if start_date.send(name.to_sym)
      start_date += 1
    end
  end
end
