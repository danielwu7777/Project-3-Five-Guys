#File created 6/9/2022 by Jake McCann
# File Edited 6/10/2022 by Noah Moon
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# Edited 6/18/2022 by Noah Moon
# Edited 6/19/2022 by Noah Moon
require_relative 'web_wrapper'
require_relative 'serializer'
require_relative 'scraper'
require_relative 'regex_factory'

class Course_Section_Factory
  attr_reader :courses_selected, :sections_selected
  attr_accessor :course_num

  # Created 6/9/2022 by Jake McCann
  # Edited 6/18/2022 by Noah Moon
  def initialize
    @web = Web_Wrapper.new
    @course_num = nil
  end

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon
  # Edited 6/18/2022 by Noah Moon
  # Gets all CSE courses according to filter, if filter = nil all courses are returned
  def courses filter_parameters
    # fetches and print html page of sections
    @courses_selected = Serializer.serialize_courses Scraper.scrape_courses(Regex_Factory.convert_course_filter_to_regex(filter_parameters), @web.courses_html)
  end

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon
  # Edited 6/18/2022 by Noah Moon
  # Gets all CSE sections for chosen class num according to filter, if filter = nil all sections are returned
  def sections filter_parameters, course_num
    # fetches and print html page of sections
    @course_num = course_num if course_num != nil
    @sections_selected = Serializer.serialize_sections Scraper.scrape_sections(Regex_Factory.convert_section_filter_to_regex(filter_parameters), @web.sections_html(@course_num))
  end

end