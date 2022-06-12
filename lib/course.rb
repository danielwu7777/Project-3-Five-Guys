# File created 6/9/2022 by Noah Moon
# File edited 6/10/2022 by Noah Moon

class Course
  attr_reader :course_num, :course_title, :description, :prereqs, :hours

=begin
class_num = String - course catelog number. Ex. for cse3901, class_num = 3901
course_title = String - name of course.
description = String - description of course
=end
  # Created 6/9/2022 by Noah Moon
  # Edited 6/10/2022 by Noah Moon: added prereqs and hours
  def initialize(class_num, course_title, description, prereqs, hours)
    @course_num= class_num
    @course_title = course_title
    @description = description
    @prereqs = prereqs
    @hours = hours
  end

end
