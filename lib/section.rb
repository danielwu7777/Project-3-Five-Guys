# File created 6/9/2022 by Noah Moon
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# Edited 6/19/2022 by Noah Moon
class Section
  attr_reader :section_num,:term,:mode,:city,:building,:room,:days,:start_time, :end_time

=begin
Returns section class with given values as attributes
parameters:
  course_title = String - name of course. optional after next instance
  section_num = String - course catelog number. Ex. for cse3901, class_num = 3901
  term = String - spring, summer, or fall
  mode = String - mode of class: in-person, online
  city = String - name of city: Columbus, Mansfield, Newark, ect.
  building = String - name of building
  room_num = String - room number within building
  days_of_week = String - days of classes
  start_time = String - range of class start_time
=end
  # Created 6/9/2022 by Noah Moon
  def initialize section_num, term, mode, city, building, room_num, days_of_week, start_time, end_time, course_title = nil
    @section_num, @term, @mode, @city, @building, @room, @days, @start_time, @end_time = section_num,
      term, mode, city, building, room_num, days_of_week, start_time, end_time
    @@course_title = course_title if course_title != nil
  end

  # returns title, necessary because attr_reader does not work for class vars
  # Created 6/9/2022 by Noah Moon
  def title
    @@course_title
  end

  #Created 6/11/2022 by Noah Moon
  # Return section as well-formed string
  def to_s
    "Course Title: #{@@course_title}\nSection Number: #{@section_num}\nterm: #{@term}\nmode: #{@mode}"\
    "\ncity: #{@city}\nBuilding: #{@building}\nRoom: #{@room}\nDays: #{@days}\nStart Time: #{@start_time}"\
    "\nEnd Time: #{@end_time}"
  end
end