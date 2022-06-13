# Created 6/8/2022 by Jake McCann
# Edited 6/12/2022 by Daniel Wu

class Regex_Factory
  # Created 6/8/2022 by Jake McCann
  # Edited 6/12/2022 by Daniel Wu: using TDD to implement method
  # Edited 6/13/2022 by Daniel Wu: added ability to iterate through hash
  # filter_parameters: hash containing key-val pairs describing how user wants courses filtered
  def self.convert_course_filter_to_regex(filter_parameters)
    regExpString = ""
    # Counter to know when at the last key-val pair in hash
    counter = 1
    filter_parameters.each do |key, value|
      case key
      when "num"
        # If statement determines whether to append .* at the end of regExpString
        if counter == filter_parameters.size then 
          regExpString += "class=[\'|\"]number[\'|\"]>\\(#{value}\\)"
        else regExpString += "class=[\'|\"]number[\'|\"]>\\(#{value}\\).*"
        end  
      when "title"
        if counter == filter_parameters.size then 
          regExpString += "class=[\'|\"]title[\'|\"]>.*#{value}"
        else regExpString += "class=[\'|\"]title[\'|\"]>.*#{value}.*"
        end  
      when "descr"
        if counter == filter_parameters.size then 
          regExpString += "class=[\'|\"]label[\'|\"]>Description.*#{value}"
        else 
          regExpString += "class=[\'|\"]label[\'|\"]>Description.*#{value}.*"
        end  
      when "pre"
        if counter == filter_parameters.size then 
          regExpString += "Prereq:.*#{value}"
        else regExpString += "Prereq:.*#{value}.*"
        end  
      when "hrs"
        if counter == filter_parameters.size then 
          regExpString += "class=[\'|\"]label[\'|\"]>.*Units:<\/span>.*#{value}"
        else regExpString += "class=[\'|\"]label[\'|\"]>.*Units:<\/span>.*#{value}.*"
        end 
      end
      counter += 1
    end
    return Regexp.new(regExpString)
  end
end