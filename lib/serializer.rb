require_relative '../lib/course'
require_relative '../lib/regex_factory'
# Created 6/9/2022 by Jake McCann
# Edited 6/10/2022 by Noah Moon
# Edited 6/11/2022 by Noah Moon
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# Edited 6/17/2022 by Noah Moon
class Serializer
  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon : made class method, implemented method
  # Edited 6/11/2022 by Noah Moon
  # Edited 6/17/2022 by Noah Moon
  # courses_html: array of HTML sections where each element describes an entire course
  def self.serialize_courses courses_html
    # Convert courses_html into array of courses
    course_list = Array.new
    courses_html.each do |course_string|
      course_list.unshift Course.new course_string.match(Regex_Factory::Serializer_course_num_regex).to_s,
                                     course_string.match(Regex_Factory::Serializer_course_title_regex).to_s,
                                     course_string.match(Regex_Factory::Serializer_course_desc_regex).to_s,
                                     course_string.match(Regex_Factory::Serializer_course_prereq_regex).to_s,
                                     course_string.match(Regex_Factory::Serializer_course_hours_regex).to_s
    end
    course_list
  end

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon : made class method
  # sections_html: array of HTML sections where each element describes an entire section
  def self.serialize_sections sections_html
    # Convert sections_html into array of sections
  end
end