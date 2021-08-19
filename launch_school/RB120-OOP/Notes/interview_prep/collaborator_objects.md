# what are collaborator objects?
Collaborator objects are objects that are part of another object's state. Basically, whatever is stored in the instance variable of an object is a collaborator object.

# relation to OOP
-it allows us to create these custom objects that have certain relationships with other objects
-enables us to model real-world relationships in a flexible way

# Example
```ruby
class Student
  attr_reader :name, :courses

  def initialize(name)
    @name = name
    @courses =  []
  end

  def enroll(course)
    courses << course
  end
end

class Course
  def initialize(name, faculty, department)
    @name = name
    @faculty = faculty
    @department = department
  end
end

math101 = Course.new("Intro to Calculus", "Peter Slome", :mathematics)

molly = Student.new("Molly Glum")

molly.enroll(math101)

p molly.courses
```

Here, `math101` is a collaborator object of `molly` object.