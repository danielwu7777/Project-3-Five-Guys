# File created 6/9/2022 by Noah Moon

class Section
  attr_reader :section_num,:term,:mode,:city,:building,:room,:days,:time

=begin
course_title = String - name of course. optional after next instance
section_num = String - course catelog number. Ex. for cse3901, class_num = 3901
term = String - spring, summer, or fall
mode = String - mode of class: in-person, online
city = String - name of city: Columbus, Mansfield, Newark, ect.
building = String - name of building
room_num = String - room number within building
days_of_week = String - days of classes
time = String - range of class time

=end
  # Created 6/9/2022 by Noah Moon
  def initialize(section_num, term, mode, city, building, room_num, days_of_week, time, course_title = nil)
    @section_num = section_num
    @term = term
    @mode = mode
    @city = city
    @building = building
    @room = room_num
    @days = days_of_week
    @time = time
    @@course_title = course_title if course_title != nil
  end
  #returns title, necessary because attr_reader does not work for class vars
  # Created 6/9/2022 by Noah Moon
  def title
    @@course_title
  end
end