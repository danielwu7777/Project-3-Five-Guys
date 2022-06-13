# Created 6/8/2022 by Jake McCann
# Edited 6/12/2022 by Yuhao Yan: Class implemented
require_relative 'section'
require_relative './course'

class Deserializer
  # Created 6/8/2022 by Jake McCann
  # Edited 6/12/2022 by Yuhao Yan: Add implementation
  # @sections: array of section objects
  # @path: a relative file path and name for the HTML file
  # convert sections to html to be printed to file
  def self.print_file(sections, path)
    # Open the HTML output file
    htm_file = File.new path, "w"
    
    #Print HTML file when it opened successfully
    if htm_file

      title = "No result"
      title = sections[0].title if sections.size > 0

      head_print htm_file, title
      body_print htm_file, sections

    else
      puts "Unable to open file!"
    end
    
    htm_file.close
  end

  # Created 6/13/2022 by Noah Moon
  def self.print_courses_file(courses, path)
    # Open the HTML output file
    htm_file = File.new path, "w"

    #Print HTML file when it opened successfully
    if htm_file

      title = "No result"
      title = "courses" if courses.size > 0

      head_print htm_file, title
      body_print_courses htm_file, courses

    else
      puts "Unable to open file!"
    end

    htm_file.close
  end


  private

  # Created 6/12/2022 by Yuhao Yan
  # Prints the header part of HTML
  def self.head_print(file, title)
    file.syswrite "<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\">\n<title>"
    file.syswrite title + "</title>\n</head>\n"
  end

  # Created 6/12/2022 by Yuhao Yan
  # Edited 6/13/2022 by Noah Moon: added method parenthesis
  # Prints the body part of HTML
  def self.body_print(file, sections)
    file.syswrite "<body>\n"

    sections.each { |section| 
      section_print file, section
    }

    file.syswrite "</body>\n</html>\n"
  end

  # Created 6/13/2022 by Noah Moon
  def self.body_print_courses(file, courses)
    file.syswrite "<body>\n"
    file.syswrite "<h1>All Courses</h1>"

    courses.each { |course|
      course_print file, course
    }

    file.syswrite "</body>\n</html>\n"
  end

  # Created 6/13/2022 by Noah Moon
  def self.course_print(file, course)
    file.syswrite "<p>\n"

    file.syswrite "Course Title: " + course.course_title + "<br>"
    file.syswrite "\nCourse Number: " + course.course_num + "<br>"
    file.syswrite "\nDescription: " + course.description + "<br>"
    file.syswrite "\nPrereqs: " + course.prereqs + "<br>"
    file.syswrite "\nHours: " + course.hours + "<br>"


    file.syswrite "\n</p>\n"

  end


  # Created 6/12/2022 by Yuhao Yan
  # Edited 6/13/2022 by Noah Moon: added method parenthesis
  # Prints a paragraph of a sigle section
  def self.section_print(file, section)
    file.syswrite "<p>\n"

    file.syswrite "section_num: " + section.section_num + "<br>"
    file.syswrite "\nterm: " + section.term + "<br>"
    file.syswrite "\nmode: " + section.mode + "<br>"
    file.syswrite "\ncity: " + section.city + "<br>"
    file.syswrite "\nbuilding: " + section.building + "<br>"
    file.syswrite "\nroom_num: " + section.room + "<br>"
    file.syswrite "\ndays_of_week: " + section.days + "<br>"
    file.syswrite "\ntime: " + section.time + "<br>"

    file.syswrite "\n</p>\n"

  end

end

