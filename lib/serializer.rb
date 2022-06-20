require_relative '../lib/course'
require_relative '../lib/section'
require_relative '../lib/regex_factory'
# Created 6/9/2022 by Jake McCann
# Edited 6/10/2022 by Noah Moon
# Edited 6/11/2022 by Noah Moon
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# Edited 6/17/2022 by Noah Moon
# Edited 6/19/2022 by Noah Moon
class Serializer
  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon : made class method, implemented method
  # Edited 6/11/2022 by Noah Moon
  # Edited 6/17/2022 by Noah Moon
=begin
     Returns array of course objects
     courses_html: array of HTML sections where each element describes an entire course
=end
     def self.serialize_courses courses_html
    # Convert courses_html into array of courses
    course_list = Array.new
    courses_html.each do |course_string|
      course_list.unshift Course.new course_string.match(Regex_Factory::SERIAL_CLASS_NUM_REGEX).to_s,
                                     course_string.match(Regex_Factory::SERIAL_CLASS_TITLE_REGEX).to_s,
                                     course_string.match(Regex_Factory::SERIAL_CLASS_DESC_REGEX).to_s,
                                     course_string.match(Regex_Factory::SERIAL_CLASS_PREREQ_REGEX).to_s,
                                     course_string.match(Regex_Factory::SERIAL_CLASS_HOURS_REGEX).to_s
    end
    course_list
  end

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon : made class method
=begin
  Returns array of section objects
  sections_html: array of HTML sections where each element describes an entire section
=end
  def self.serialize_sections sections_array
    section_list = Array.new
    sections_array.each do |section_string|
      section_list.unshift Section.new section_string.match(Regex_Factory::SERIAL_SECTION_SECNUM_REGEX).to_s,
                                       section_string.match(Regex_Factory::SERIAL_SECTION_TERM_REGEX).to_s,
                                       section_string.match(Regex_Factory::SERIAL_SECTION_MODE_REGEX).to_s,
                                       section_string.match(Regex_Factory::SERIAL_SECTION_CITY_REGEX).to_s,
                                       section_string.match(Regex_Factory::SERIAL_SECTION_BUILDING_REGEX).to_s,
                                       section_string.match(Regex_Factory::SERIAL_SECTION_ROOM_REGEX).to_s,
                                       Serializer.days_string(section_string.match(Regex_Factory::SERIAL_SECTION_DAYS_REGEX).to_s),
                                       section_string.match(Regex_Factory::SERIAL_SECTION_START_REGEX).to_s,
                                       section_string.match(Regex_Factory::SERIAL_SECTION_END_REGEX).to_s,
                                       section_string.match(Regex_Factory::SERIAL_SECTION_TITLE_REGEX).to_s
    end
    section_list
  end

  private

  # Created 6/18/2022 by Noah Moon
  # returns well formed string of days of the week from raw data string
  def self.days_string raw_string
    days_enum = %w[M Tu W Th F Sa Su]
    new_String = ""
    raw_string.split(',').each_with_index { |day_line,index |  new_String += days_enum[index] + " " if day_line.split(':')[1] == "true"}
    new_String[0...new_String.length-1]

  end

  # Created 6/19/2022 by Noah Moon
  # returns raw data string from well formed string
  def self.days_to_raw clean_string
    day_hash = {"monday"=>false,"tuesday"=>false,"wednesday"=>false,"thursday"=>false,"friday"=>false,"saturday"=>false,"sunday"=>false  }
    new_String = ""
    clean_string.split.each do |day_char|
      case day_char
      when "M"
        day_hash["monday"] = true
      when "Tu"
        day_hash["tuesday"] = true
      when "W"
        day_hash["wednesday"] = true
      when "Th"
        day_hash["thursday"] = true
      when "F"
        day_hash["friday"] = true
      when "Sa"
        day_hash["saturday"] = true
      when "Su"
        day_hash["sunday"] = true
      end
    end
    day_hash.each_pair{|day,bool| new_String += "\"#{day}\":#{bool.to_s}," }
    new_String
  end
end
