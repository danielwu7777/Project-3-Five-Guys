# File created 6/9/2022 by Noah Moon
# File edited 6/10/2022 by Noah Moon
# File edited 6/11/2022 by Noah Moon

class Course
  attr_reader :course_num, :course_title, :description, :prereqs, :hours

=begin
class_num = String - course catelog number. Ex. for cse3901, class_num = "3901"
course_title = String - name of course. Ex. for cse1110, title = "Introduction to Computing Technology"
description = String - description of course. Ex description = "this is the description of a course"
prereqs = String - prereqs/concurrent classes for course. Ex. prereqs = "cse1111 prereq/concur: cse2221"
hours = String - credit hours for course. Ex. hours = "3"
=end
  # Created 6/9/2022 by Noah Moon
  # Edited 6/10/2022 by Noah Moon: added prereqs and hours
  # Edited 6/11/2022 by Noah Moon: added parallel assignment
  def initialize(class_num, course_title, description, prereqs, hours)
    @course_num , @course_title, @description, @prereqs, @hours = class_num, course_title, description, prereqs, hours
  end

  #Created 6/11/2022 by Noah Moon
  def to_s
    "Course Title: #{@course_title}\nCourse Number: #{@course_num}\nDescription: #{@description}\nPrereqs: #{@prereqs}"\
    "\nHours: #{@hours}"
  end

end