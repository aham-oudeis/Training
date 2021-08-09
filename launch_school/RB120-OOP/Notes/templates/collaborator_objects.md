###  Collaborator objects

Collaborator objects are objects that are part of the state of another object.

Collaborator objects enable programmers to work with custom-objects and to model real-world relationships between objects.

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
In this example, we define the Course class in a way that a course object has three instance variables. Say, the Course object's instance variable @name stores a string. In this sense, the string object is a collaborator object of Course object.

Say, we store an array object in the instance variable @students. In that case, the array object would be the collaborator object of the course object.

Likewise, the Faculty object stored in the instance variable @teacher is also the collaborator object.
=end
```

