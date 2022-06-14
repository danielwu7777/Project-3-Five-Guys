# Created 6/8/2022 by Jake McCann
# Edited 6/12/2022 by Daniel Wu
# Edited 6/14/2022 by Noah Moon
class Regex_Factory
  # TODO: remove these comments
  # ?<= is look-behind
  # ?= is look-ahead
  Serializer_course_num_regex = /(?<=<span class=['|"]number['|"]>\().*?(?=\))/
  Serializer_course_title_regex = /(?<=<span class=['|"]title['|"]>).*?(?=<)/
  Serializer_course_desc_regex = /(?<=class=['|"]label['|"]>Description:<\/span> ).*?(?=<)/
  Serializer_course_prereq_regex = /(?<=Prereq: ).*?(?= <)/
  Serializer_course_hours_regex = /(?<=Units:<\/span> ).*?(?=<)/

  # Created 6/8/2022 by Jake McCann
  # Edited 6/12/2022 by Daniel Wu: using TDD to implement method
  # Edited 6/13/2022 by Daniel Wu: added ability to iterate through hash
  # filter_parameters: hash containing key-val pairs describing how user wants courses filtered
  def self.convert_course_filter_to_regex filter_parameters
    regExpString = ""
    # Counter to know when at the last key-val pair in hash
    counter = 1
    filter_parameters.each do |key, value|
      case key
        when "num"
            regExpString += "class=[\'|\"]number[\'|\"]>\\(#{value}\\)" 
        when "title"
            regExpString += "class=[\'|\"]title[\'|\"]>.*#{value}"
        when "descr"
            regExpString += "class=[\'|\"]label[\'|\"]>Description.*#{value}"
        when "pre"
            regExpString += "Prereq:.*#{value}"
        when "hrs"
            regExpString += "class=[\'|\"]label[\'|\"]>.*Units:<\/span>.*#{value}"
      end
      # Determines whether to append .* at the end of regExpString
      if counter != filter_parameters.size then regExpString += ".*" end
      counter += 1
    end
    return Regexp.new(regExpString)
  end
end