#File created 6/9/2022 by Jake McCann
# File Edited 6/10/2022 by Noah Moon
class Course_Section_Factory

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon
  def initialize
    #Create web wrapper
    @web = Web_Wrapper.new
  end

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon
  def courses(filter_parameters)
    # fetches and print html page of sections
    Serializer.serialize_courses Scraper.scrape filter_parameters, @web.courses_html
  end

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon
  def sections(filter_parameters)
    # Return array of section objects (array for order)
  end

end