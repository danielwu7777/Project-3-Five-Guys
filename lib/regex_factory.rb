# Created 6/8/2022 by Jake McCann
# Edited 6/12/2022 by Daniel Wu
# Edited 6/14/2022 by Jake McCann
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# Edited 6/17/2022 by Noah Moon
# Edited 6/18/2022 by Noah Moon


class Regex_Factory
  Serializer_course_num_regex = /(?<=<span class=['|"]number['|"]>\().*?(?=\))/
  Serializer_course_title_regex = /(?<=<span class=['|"]title['|"]>).*?(?=<)/
  Serializer_course_desc_regex = /(?<=class=['|"]label['|"]>Description:<\/span> ).*?(?=<)/
  Serializer_course_prereq_regex = /(?<=Prereq: ).*?(?= <)/
  Serializer_course_hours_regex = /(?<=Units:<\/span> ).*?(?=<)/

  Serializer_section_secnum_regex = /(?<=\"section\":").*?(?=")/
  Serializer_section_term_regex = /(?<=\"term\":").*?(?=")/
  Serializer_section_mode_regex = /(?<=\"instructionMode\":").*?(?=,"meetings)/
  Serializer_section_city_regex = /(?<=\"campus\":").*?(?=")/
  Serializer_section_building_regex = /(?<=\"buildingDescription\":").*?(?= \d*","buildingDescriptionShort)/
  Serializer_section_room_regex = /(?<=\"room\":").*?(?=")/
  Serializer_section_days_regex = /"monday.*?(?="standing)/
  Serializer_section_start_regex = /(?<=\"startTime\":").*?(?=")/
  Serializer_section_end_regex = /(?<=\"endTime\":").*?(?=")/
  Serializer_section_title_regex = /(?<=\"courseTitle\":").*?(?=")/


  Section_start_regex = "\"classNumber\".*?"
  Section_end_regex = "\"termCode\""

  # Created 6/17/2022 by Noah Moon
  def self.convert_section_filter_to_regex filter_parameters
    return if filter_parameters == nil
    regExpString = Section_start_regex
    # Counter to know when at the last key-val pair in hash
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
    regExpString += Section_end_regex
    return Regexp.new regExpString
  end

  # Created 6/8/2022 by Jake McCann
  # Edited 6/12/2022 by Daniel Wu: using TDD to implement method
  # Edited 6/13/2022 by Daniel Wu: added ability to iterate through hash
  # Edited 6/18/2022 by Noah Moon
  # filter_parameters: hash containing key-val pairs describing how user wants courses filtered
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
        regExpString += "class=[\'|\"]label[\'|\"]>Description.*?#{value}.*?(?=Prereq:).*?"
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


end