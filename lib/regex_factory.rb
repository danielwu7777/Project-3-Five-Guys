# Created 6/8/2022 by Jake McCann
# Edited 6/12/2022 by Daniel Wu
# Edited 6/14/2022 by Jake McCann
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# Edited 6/17/2022 by Noah Moon
# Edited 6/18/2022 by Noah Moon
class Regex_Factory

  # Created 6/17/2022 by Noah Moon
=begin
     Returns regex to specify sections accoring to filter parameters
     filter_parameters: Hash - key = attribute, value = desired value
=end
  def self.convert_section_filter_to_regex filter_parameters
    return if filter_parameters == nil
    regExpString = SECTION_START_REGEX
    filter_parameters.each do |key, value|
      case key
        when "sec_num"
            regExpString += "\"section\":\"#{value}\".*?"
        when "mode"
            regExpString += "\"instructionMode\":\"#{value}\",\"meetings\".*?"
        when "building"
            regExpString += "\"facilityDescriptionShort\":\"#{value}\".*?"
        when "room"
            regExpString += "\"room\":\"#{value}\".*?"
        when "start_time"
            regExpString += "\"startTime\":\"#{value}\".*?"
        when "end_time"
          regExpString += "\"endTime\":\"#{value}\".*?"
        when "days"
          regExpString += "#{value}.*?"
        when "term"
          regExpString += "\"term\":\"#{value}\".*?"
        when "city"
          regExpString += "\"campus\":\"#{value}\".*?"
      end
    end
    regExpString += SECTION_END_REGEX
    return Regexp.new regExpString
  end

  # Created 6/8/2022 by Jake McCann
  # Edited 6/12/2022 by Daniel Wu: using TDD to implement method
  # Edited 6/13/2022 by Daniel Wu: added ability to iterate through hash
  # Edited 6/18/2022 by Noah Moon
=begin
  Returns regex to specify sections accoring to filter parameters
  filter_parameters: hash containing key-val pairs describing how user wants courses filtered
=end
  def self.convert_course_filter_to_regex filter_parameters
    return if filter_parameters == nil
    regExpString = ""
    filter_parameters.each do |key, value|
      case key
      when "num"
        regExpString += "class=[\'|\"]number[\'|\"]>\\(#{value}\\)<\/span>.*?"
      when "title"
        regExpString += "<h4 class=[\'|\"]title[\'|\"]>.*?#{value}.*?(?=<span class=[\'|\"]number[\'|\"]>).*?"
      when "descr"
        regExpString += "(?<=class=['|\"]label['|\"]>Description:<\/span> ).*?#{value}.*?(?=<).*?"
      when "pre"
        regExpString += "Prereq:.*?#{value}.*?<span class=[\'|\"]label[\'|\"]>.*?"
      when "hrs"
        regExpString += "Units:<\/span> #{value}<\/p>.*?"
      end
    end
    regExpString += ".*"
    return Regexp.new regExpString
  end

=begin
  Regex expression constants
=end
  FILE_REGEX = /^(\/[a-z_\-\s0-9\.]+)*\w+\.html|\n/
  MAIN_OPTIONS_REGEX = Regexp.union %w[0 1 2]

  COURSE_OPTIONS_REGEX = Regexp.union %w[0 1 2]
  COURSE_NUM_REGEX = /\d\d\d\d|^$/
  COURSE_TITLE_REGEX = /[A-Za-z0-9]|^$/
  COURSE_DESC_REGEX = /[A-Za-z0-9]|^$/
  COURSE_PRE_REGEX = /\d\d\d\d|^$/
  COURSE_HOURS_REGEX = /\b[1-6]\b|^$/

  SECTION_MODE_REGEX = /[0|1|]|^$/
  SECTION_TERM_REGEX = /[0|1||2]|^$/
  SECTION_LOCATION_REGEX = /[0-5]|^$/
  SECTION_BUILDING_REGEX = /[A-Za-z|\s]|^$/
  SECTION_ROOM_REGEX = /\d.*?|^$/
  SECTION_TIME_REGEX = /\d{1,2}:\d{2} (am|pm)|^$/
  SECTION_DAYS_REGEX = /[M|Tu|W|Th|F|Sa|Su].*{1,7}|^$/
  SECTION_NUM_REGEX = /\d\d\d\d/
  SECTION_START_REGEX = "\"classNumber\".*?"
  SECTION_END_REGEX = "\"termCode\""

  SERIAL_CLASS_NUM_REGEX = /(?<=<span class=['|"]number['|"]>\().*?(?=\))/
  SERIAL_CLASS_TITLE_REGEX = /(?<=<span class=['|"]title['|"]>).*?(?=<)/
  SERIAL_CLASS_DESC_REGEX = /(?<=class=['|"]label['|"]>Description:<\/span> ).*?(?=<)/
  SERIAL_CLASS_PREREQ_REGEX = /(?<=Prereq: ).*?(?= <)/
  SERIAL_CLASS_HOURS_REGEX = /(?<=Units:<\/span> ).*?(?=<)/

  SERIAL_SECTION_SECNUM_REGEX = /(?<=\"section\":").*?(?=")/
  SERIAL_SECTION_TERM_REGEX = /(?<=\"term\":").*?(?=")/
  SERIAL_SECTION_MODE_REGEX = /(?<=\"instructionMode\":").*?(?="*,"meetings)/
  SERIAL_SECTION_CITY_REGEX = /(?<=\"campus\":").*?(?=")/
  SERIAL_SECTION_BUILDING_REGEX = /(?<=\"buildingDescription\":").*?(?= \d*","buildingDescriptionShort)/
  SERIAL_SECTION_ROOM_REGEX = /(?<=\"room\":").*?(?=")/
  SERIAL_SECTION_DAYS_REGEX = /"monday.*?(?="standing)/
  SERIAL_SECTION_START_REGEX = /(?<=\"startTime\":").*?(?=")/
  SERIAL_SECTION_END_REGEX = /(?<=\"endTime\":").*?(?=")/
  SERIAL_SECTION_TITLE_REGEX = /(?<=\"courseTitle\":").*?(?=")/
end