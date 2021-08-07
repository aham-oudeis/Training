### attr_* methods

attr_* methods are prefered for their simplicity, but when there are other demands
in place, we would have to use manual getter and setter methods. For instance, when we need to have a built-in customization for accessing and setting instance variables.


```ruby
class Course
  attr_acessor :name, :teacher

  def initialize(name, teacher)
    @name = name
    @teacher = teacher
    @students = []
  end

  def enroll(student)
    if students.size < 30
    	students << student
    else
      puts "Class full!"
    end
  end

  private

  attr_reader :students
end

```

###