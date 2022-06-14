# File created 6/8/2022 by Daniel Wu 
# File edited 6/11/2022 by Jake McCann
# File edited 6/14/2022 by Noah Moon
require_relative 'course_section_factory'
require_relative 'utility'
require_relative 'safe_input'
require_relative 'deserializer'
require_relative 'regex_factory'
require 'launchy'

class User_Input

    # Created 6/8/2022 by Daniel Wu
    # Edited 6/11/2022 by Jake McCann: factory now created
    def initialize
        @data_factory = Course_Section_Factory.new
    end

    # Created 6/11/2022 by Jake McCann
    # Prompts user and gets input
    def main_io
        menu_template{main_menu}
        case Safe_Input.safe_input(Regex_Factory::MAIN_OPTIONS_REGEX) { puts MENU_SELECTION_ERRMSG }
        when "0"
            return
        when "1"
            courses_io nil
        end
    end

    # Created 6/11/2022 by Jake McCann
    # Edited 6/13/2022 by Noah Moon
    def courses_io filter_hash
        @data_factory.courses(filter_hash).each{|course| puts(Utility.wrap_string "\n#{course.to_s}", 90)}
        menu_template { courses_menu }

        case Safe_Input.safe_input(Regex_Factory::COURSE_OPTIONS_REGEX) { puts MENU_SELECTION_ERRMSG }
        when "0"
            main_io
        when "1"
            file_io
            Launchy.open("./Courses.html")
        when "2"
            course_filter_io
        end
    end

    #Created 6/14/2022 by Jake McCann
    def file_io
        menu_template {file_menu}
        input = Safe_Input.safe_input(Regex_Factory::FILE_REGEX) { puts MENU_SELECTION_ERRMSG }
        Deserializer.print_courses_file @data_factory.courses(nil), input if input != 0
    end

    def course_filter_io
        filter_hash = Hash.new
        menu_template {filter_menu}
        print "Course number filter: "
        filter_hash[:num] = Safe_Input.safe_input(Regex_Factory::COURSE_NUM_REGEX) {puts COURSE_NUM_ERRMSG}
        print"Course title filter: "
        filter_hash[:title] = Safe_Input.safe_input(Regex_Factory::COURSE_TITLE_REGEX) {puts COURSE_TITLE_ERRMSG}
        print "Course description filter: "
        filter_hash[:desc] = Safe_Input.safe_input(Regex_Factory::COURSE_DESC_REGEX) {puts COURSE_DESC_ERRMSG}
        print "Course prereqs filter: "
        filter_hash[:pre] = Safe_Input.safe_input(Regex_Factory::COURSE_PRE_REGEX) {puts COURSE_PREREQ_ERRMSG}
        print "Course hours filter: "
        filter_hash[:hrs] = Safe_Input.safe_input(Regex_Factory::COURSE_HOURS_REGEX) {puts COURSE_HOURS_ERRMSG}
        courses_io filter_hash
    end

    private
    # Created 6/14/2022 by Jake McCann
    def menu_template
        system "clear"
        puts MENU_BORDER
        puts "\n"
        yield if block_given?
        puts "\n"
        puts MENU_BORDER
        end
=begin
    Menus
=end
    # Created 6/11/2022 by Jake McCann
    def main_menu
        puts "Welcome to the course navigator"
        puts "\nEnter the number of what you want to do."
        puts "[1] View courses"
        puts "[0] Quit"
    end

    #Created 6/12/2022 by Jake McCann
    def courses_menu
        puts "All found CSE courses are listed above"
        puts "\nEnter the number of what you want to do."
        puts "[2] Filter courses"
        puts "[1] Print current displayed courses to HTML"
        puts "[0] Return to main menu"
    end

    #Created 6/14/2022 by Jake McCann
    def file_menu
        puts "Enter valid file name or path ending in .html"
        puts "[0] Return to main menu"
    end

    #Created 6/14/2022 by Jake McCann
    def filter_menu
        puts "Enter the filter values for each course property"
        puts "Do not enter anything if you do not wish to filter by that property"
    end

=begin
    Constants
=end
    MENU_BORDER = '=' * 45
    MENU_SELECTION_ERRMSG = "Invalid input received, try again"
    FILE_NAME_ERRMSG = "Invalid file name or path, try again"
    COURSE_NUM_ERRMSG = "Invalid filter value for course number, try again"
    COURSE_TITLE_ERRMSG = "Invalid filter value for course title, try again"
    COURSE_DESC_ERRMSG = "Invalid filter value for course description, try again"
    COURSE_PREREQ_ERRMSG = "Invalid filter value for course prereqs, try again"
    COURSE_HOURS_ERRMSG = "Invalid filter value for hours, try again"
end
