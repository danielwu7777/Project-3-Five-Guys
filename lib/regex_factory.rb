# Created 6/8/2022 by Jake McCann
# Edited 6/12/2022 by Daniel Wu

class Regex_Factory
  # Created 6/8/2022 by Jake McCann
  # Edited 6/12/2022 by Daniel Wu: using TDD to implement method
  # filter_parameters: hash containing key-val pairs describing how user wants courses filtered
  def self.convert_course_filter_to_regex(filter_parameters)
    case filter_parameters.keys[0]
    when "num"
      return /class=['|"]number['|"]>\(#{filter_parameters.values[0]}\)/
    when "title"
      return /class=['|"]title['|"]>.*#{filter_parameters.values[0]}/
    when "descr"
      return /class=['|"]label['|"]>Description.*#{filter_parameters.values[0]}/
    when "pre"
      return /Prereq:.*#{filter_parameters.values[0]}/
    when "hrs"
      return /class=['|"]label['|"]>.*Units:<\/span>.*#{filter_parameters.values[0]}/ 
    end
  end
end