require_relative '../lib/course'
require_relative '../lib/section'
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
  def self.serialize_sections sections_array
    # Convert sections_html into array of sections
    section_list = Array.new
    sections_array.each do |section_string|
      section_list.unshift Section.new section_string.match(Regex_Factory::Serializer_section_secnum_regex).to_s,
                                       section_string.match(Regex_Factory::Serializer_section_term_regex).to_s,
                                       section_string.match(Regex_Factory::Serializer_section_mode_regex).to_s,
                                       section_string.match(Regex_Factory::Serializer_section_city_regex).to_s,
                                       section_string.match(Regex_Factory::Serializer_section_building_regex).to_s,
                                       section_string.match(Regex_Factory::Serializer_section_room_regex).to_s,
                                       Serializer.days_string(section_string.match(Regex_Factory::Serializer_section_days_regex).to_s),
                                       section_string.match(Regex_Factory::Serializer_section_start_regex).to_s,
                                       section_string.match(Regex_Factory::Serializer_section_end_regex).to_s,
                                       section_string.match(Regex_Factory::Serializer_section_title_regex).to_s
    end
    section_list
  end

  private
  # returns well formed string of days of the week from raw data string
  def self.days_string raw_string
    days_enum = %w[M Tu W Th F Sa Su]
    new_String = ""
    raw_string.split(',').each_with_index { |day_line,index |  new_String += days_enum[index] + " " if day_line.split(':')[1] == "true"}
    new_String

  end
end
