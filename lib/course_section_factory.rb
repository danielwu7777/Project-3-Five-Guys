#File created 6/9/2022 by Jake McCann
# File Edited 6/10/2022 by Noah Moon
require_relative 'web_wrapper'
require_relative 'serializer'
require_relative 'scraper'

class Course_Section_Factory

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon
  def initialize
    #Create web wrapper
    @web = Web_Wrapper.new
  end

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon
  # Edited 6/16/2022 by Daniel Wu: Removed filter_parameter input to display all courses
  def all_courses
    # Fetches and print html page of all courses
    Serializer.serialize_courses Scraper.scrape_all_courses @web.courses_html
  end

  # Created 6/16/2022 by Daniel Wu
  def filter_courses(filter_as_regex)
    # Filter the courses with regex input
    Serializer.serialize_courses Scraper.scrape_courses(filter_as_regex, @web.courses_html)
  end

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon
  def sections(filter_parameters)
    # Return array of section objects (array for order)
  end

end