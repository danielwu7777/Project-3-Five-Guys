# Created 6/8/2022 by Jake McCann
# Edited 6/12/2022 by Yuhao Yan: Class implemented
# Edited 6/16/2022 by Yuhao Yan: Reimplemented for adding CSS
# Edited 6/18/2022 by Yuhao Yan: to match section.rb changes
require_relative 'section'
require_relative './course'

CSS_FILE = "./lib/style.css"

class Deserializer
  # Created 6/8/2022 by Jake McCann
  # Edited 6/12/2022 by Yuhao Yan: Add implementation
  # Edited 6/16/2022 by Yuhao Yan: Edit method call
  # @sections: array of section objects
  # @path: a relative file path and name for the HTML file
  # convert sections to html to be printed to file
  def self.print_file sections, path
    # Open the HTML output file
    htm_file = File.new path, "w"
    
    #Print HTML file when it opened successfully
    if htm_file

      title = "No result"
      title = sections[0].title if sections.size > 0

      head_print htm_file, title
      body_print htm_file, sections, title
      puts "#{htm_file.path} successfully created"
    else
      puts "Unable to open file!"
    end
    
    htm_file.close
  end

  # Created 6/13/2022 by Noah Moon
  # Edited 6/16/2022 by Yuhao Yan
  # Edited 6/18/2022 by Noah Moon
  def self.print_courses_file courses, path
    # Open the HTML output file
    htm_file = File.new path, "w"

    #Print HTML file when it opened successfully
    if htm_file

      title = "No result"
      title = "courses" if courses.size > 0

      head_print htm_file, title
      body_print_courses htm_file, courses
      puts "#{htm_file.path} successfully created"
    else
      puts "Unable to open file!"
    end

    htm_file.close
  end


  private

  # Created 6/12/2022 by Yuhao Yan
  # Edited 6/13/2022 by Yuhao Yan: added tag attributes
  # Edited 6/16/2022 by Yuhao Yan: reimplement for CSS
  # Prints the header part of HTML
  def self.head_print file, title
    file.syswrite "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\">\n<title>"
    file.syswrite title + "</title>\n"
    file.syswrite "<style>\n"

    # print CSS codes into HTML file 
    IO.foreach(CSS_FILE) {|line| file.syswrite line}

    file.syswrite "</style>\n</head>\n"
  end

  # Created 6/12/2022 by Yuhao Yan
  # Edited 6/13/2022 by Noah Moon: added method parenthesis
  # Edited 6/16/2022 by Yuhao Yan: add parameter @title
  # Edited 6/16/2022 by Yuhao Yan: reimplement for CSS
  # Prints the body part of HTML
  def self.body_print file, sections, title
    file.syswrite "<body>\n"
    file.syswrite "<div class=\"title\">\nAll sections selected under <span class=\"course\">"
    file.syswrite title + "</span>:\n</div>\n"

    file.syswrite "<div class=\"content\">"
    sections.each { |section| 
      section_print file, section
    }
    file.syswrite "</div>\n"

    file.syswrite "</body>\n</html>\n"
  end

  # Created 6/13/2022 by Noah Moon
  # Edited 6/16/2022 by Yuhao Yan
  def self.body_print_courses file, courses
    file.syswrite "<body>\n"
    file.syswrite "<h1>All Courses</h1>"

    courses.each { |course|
      course_print file, course
    }

    file.syswrite "</body>\n</html>\n"
  end

  # Created 6/13/2022 by Noah Moon
  # Edited 6/16/2022 by Yuhao Yan
  def self.course_print file, course
    file.syswrite "<p>\n"

    file.syswrite "Course Title: " + course.course_title + "<br/>"
    file.syswrite "\nCourse Number: " + course.course_num + "<br/>"
    file.syswrite "\nDescription: " + course.description + "<br/>"
    file.syswrite "\nPrereqs: " + course.prereqs + "<br/>"
    file.syswrite "\nHours: " + course.hours + "<br/>"


    file.syswrite "\n</p>\n"

  end


  # Created 6/12/2022 by Yuhao Yan
  # Edited 6/13/2022 by Noah Moon: added method parenthesis
  # Edited 6/16/2022 by Yuhao Yan: reimplement for CSS
  # Edited 6/18/2022 by Yuhao Yan: to match section.rb changes
  # Prints a paragraph of a sigle section
  def self.section_print file, section

    file.syswrite "<div class=\"section\">\n"
    file.syswrite "<table class=\"att_table\">\n"

    file.syswrite "<tr><td><span class=\"attribute\">section_num<span>:</td></tr>\n"
    file.syswrite "<tr><td><span class=\"attribute\">term<span>:</td></tr>\n"
    file.syswrite "<tr><td><span class=\"attribute\">mode<span>:</td></tr>\n"
    file.syswrite "<tr><td><span class=\"attribute\">city<span>:</td></tr>\n"
    file.syswrite "<tr><td><span class=\"attribute\">building<span>:</td></tr>\n"
    file.syswrite "<tr><td><span class=\"attribute\">room_num<span>:</td></tr>\n"
    file.syswrite "<tr><td><span class=\"attribute\">days_of_week<span>:</td></tr>\n"
    file.syswrite "<tr><td><span class=\"attribute\">time<span>:</td></tr>\n"

    file.syswrite "</table>\n<table class=\"val_table\">\n"

    file.syswrite "<tr><td>" + section.section_num + "</td></tr>\n"
    file.syswrite "<tr><td>" + section.term + "</td></tr>\n"
    file.syswrite "<tr><td>" + section.mode + "</td></tr>\n"
    file.syswrite "<tr><td>" + section.city + "</td></tr>\n"
    file.syswrite "<tr><td>" + section.building + "</td></tr>\n"
    file.syswrite "<tr><td>" + section.room + "</td></tr>\n"
    file.syswrite "<tr><td>" + section.days + "</td></tr>\n"
    file.syswrite "<tr><td>" + section.start_time + " - " + section.end_time + "</td></tr>\n"

    file.syswrite "</table>\n</div>\n"

  end

end

