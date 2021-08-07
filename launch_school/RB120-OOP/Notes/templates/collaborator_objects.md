###  Working with collaborator objects

Collaborator objects are objects that are part of the state of another object.

```ruby
class Course
  def initialize(name, teacher, students)
    @name = name
    @teacher = Faculty.new(teacher)
    @students = students
  end
end

class Faculty
  def initialize(name)
    @name = name
  end
end

=begin
In this example, we define the Course class such that a string object stored in the instance variable @name is part of the Course object's attribute. In this sense, the string object is a collaborator object of Course object.

Say, we store an array object in the instance variable @students. In that case, the array object would be the collaborator object of the course object.

Likewise, the Faculty object stored in the instance variable @teacher is also the collaborator object.
=end
```

