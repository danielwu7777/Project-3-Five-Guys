# File created 6/9/2022 by Noah Moon

class Course
  attr_reader :class_num,:course_title,:description

=begin
class_num = String - course catelog number. Ex. for cse3901, class_num = 3901
course_title = String - name of course.
description = String - description of course
=end
  # Created 6/9/2022 by Noah Moon
  def initialize(class_num, course_title, description)
    @class_num= class_num
    @course_title = course_title
    @description = description
  end

end
