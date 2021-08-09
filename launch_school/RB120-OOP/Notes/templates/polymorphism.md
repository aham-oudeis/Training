### Polymorphism

Polymorphism refers to the ability of different types of objects to respond to the same method call. The basic idea is that if different objects refer to the same method call, it does not matter how the types of the objects differ. What matters is that they respond to the same method. This feature enables programmer to write DRY code.

Polymorphism enables programmers to work in a rather flexible way with the objects.

There are two main kinds of polymorphism: __through inheritance__ and __duck typing__.

When different related types of objects respond to the same method call because they either inherit the same method or extend the same method in different ways, it is said to implement __polymorphism through inheritance__.

Here is an example:

```ruby

class PetSitter
  def take_care_of(pets)
    pets.each do |pet|
      puts "#{pet.class}: #{pet.take_care}"
    end
  end
end

module Careable
  def take_care
    "Feed me"
  end
end

class Dog
  include Careable

  def take_care
    super + " and take me for a walk"
  end
end

class Cat
  include Careable

  def take_care
    super + " and clean my litter box."
  end
end

gilbert = Dog.new
sophie = Cat.new
my_pets = [gilbert, sophie]

mohan = PetSitter.new

mohan.take_care_of(my_pets)
```

When unrelated types of objects respond to the same method call because they are designed to do so in a systematic way, then it is said to implement polymorphism through duck typing. Basically, we care about what the objects are designed to do rather than the class they belong to.

Here is an example of duck-typing.

```ruby
class Course
  attr_reader :name, :book, :syllabus, :students

  def initialize(name, book, syllabus=nil)
    @name = name
    @book = book
    @syllabus = syllabus
    @students = []
  end

  def enroll(student)
    students << student
  end

  def assign_responsibilities(participants)
    participants.each do |participant|
      participant.prepare_for(self)
    end
  end
end

class Student
  def prepare_for(course)
    # buy(course.book)
    # read(course.syllabus)
    # read(course.book.chapters)
  end
end

class TeachingAssistant
  def prepare_for(course)
    # read(course.syllabus)
    # compile_questions(course.syllabus)
    # prepare_notes(course.book.chapters)
    # grade_exams(course.students)
  end
end

class Faculty
  def prepare_for(course)
    # email(course.students)
    # create_lesson_plan(course.book)
    # create_study_guide(course.book)
  end
end

molly = Student.new

cottonfield = TeachingAssistant.new

mira = Faculty.new

ancient_ethics = Course.new("Ancient Ethics", "Ancient Ethics by Julia Annas")
ancient_ethics.enroll(molly)

ancient_ethics.assign_responsibilities([molly, cottonfield, mira])
```
