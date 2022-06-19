# File created 6/8/2022 by Daniel Wu 
# File edited 6/11/2022 by Jake McCann
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# Edited 6/18/2022 by Noah Moon
require_relative 'course_section_factory'
require_relative 'utility'
require_relative 'safe_input'
require_relative 'deserializer'
require_relative 'regex_factory'
require 'launchy'

class User_Input
    MODE_ENUM = ["In Person", "Distance Learning"]
    TERM_ENUM = ["Spring 2022", "Autumn 2022", "Summer 2022"]
    CAMPUS_ENUM = %w[Columbus Lima Mansfield Marion Newark Wooster]

    # Created 6/8/2022 by Daniel Wu
    # Edited 6/11/2022 by Jake McCann: factory now created
    def initialize
        @data_factory = Course_Section_Factory.new
    end

    # Created 6/11/2022 by Jake McCann
    # Prompts user and gets input
    def main_io
        system "clear"
        menu_template{main_menu}
        case Safe_Input.safe_input(Regex_Factory::MAIN_OPTIONS_REGEX) { puts MENU_SELECTION_ERRMSG }
        when "0"
            system "clear"
            return
        when "1"
            courses_io nil
        when "2"
            @data_factory.course_num = nil
            section_io nil
        end
    end

    # Created 6/11/2022 by Jake McCann
    # Edited 6/13/2022 by Noah Moon
    def courses_io filter_hash
        system "clear"
        @data_factory.courses(filter_hash).each{|course| puts(Utility.wrap_string "\n#{course.to_s}", 90)}
        menu_template { courses_menu }

        case Safe_Input.safe_input(Regex_Factory::COURSE_OPTIONS_REGEX) { puts MENU_SELECTION_ERRMSG }
        when "0"
            main_io
        when "1"
            file_io true
        when "2"
            course_filter_io
        end
    end

    # Created by Noah Moon 6/18/2022
    def section_io filter_hash
        system "clear"
        course_num = nil
        if @data_factory.course_num == nil
            print "Enter the 4-digit class number whose sections you would like to view: "
            course_num = Safe_Input.safe_input(Regex_Factory::COURSE_NUM_REGEX) {puts COURSE_NUM_ERRMSG}
        end

        system "clear"
        @data_factory.sections(filter_hash, course_num).each{|section| puts(Utility.wrap_string "\n#{section.to_s}", 90)}
        menu_template { section_menu }

        case Safe_Input.safe_input(Regex_Factory::COURSE_OPTIONS_REGEX) { puts MENU_SELECTION_ERRMSG }
        when "0"
            main_io
        when "1"
            file_io false
        when "2"
            section_filter_io
        end
    end
    #Created 6/14/2022 by Jake McCann
    # Edited 6/18/2022 by Noah Moon
    # course_bool = true if course, false if section
    def file_io course_bool
        system "clear"
        menu_template {file_menu}
        input = Safe_Input.safe_input(Regex_Factory::FILE_REGEX) { puts MENU_SELECTION_ERRMSG }
        if course_bool
            Deserializer.print_courses_file @data_factory.courses_selected, input if input != 0
        else
            Deserializer.print_file @data_factory.sections_selected, input if input != 0
        end
    end

    # Created 6/14/2022 by Jake McCann
    # Edited 6/18/2022 by Noah Moon
    def course_filter_io
        filter_hash = Hash.new
        menu_template {filter_menu}
        print"Course title filter: "
        input = Safe_Input.safe_input(Regex_Factory::COURSE_TITLE_REGEX) {puts COURSE_TITLE_ERRMSG}
        filter_hash["title"] = input if input != ""
        print "Course number filter (4-digit number): "
        input = Safe_Input.safe_input(Regex_Factory::COURSE_NUM_REGEX) {puts COURSE_NUM_ERRMSG}
        filter_hash["num"] = input if input != ""
        print "Course description filter: "
        input = Safe_Input.safe_input(Regex_Factory::COURSE_DESC_REGEX) {puts COURSE_DESC_ERRMSG}
        filter_hash["desc"] = input if input != ""
        print "Course prereqs filter: (4-digit number)"
        input = Safe_Input.safe_input(Regex_Factory::COURSE_PRE_REGEX) {puts COURSE_PREREQ_ERRMSG}
        filter_hash["pre"] = input if input != ""
        print "Course hours filter: "
        input = Safe_Input.safe_input(Regex_Factory::COURSE_HOURS_REGEX) {puts COURSE_HOURS_ERRMSG}
        filter_hash["hrs"] = input if input != ""
        courses_io filter_hash

    end

    # Created 6/18/2022 by Noah Moon
    def section_filter_io
        filter_hash = Hash.new
        menu_template {filter_menu}
        print"Section Number filter: "
        input = Safe_Input.safe_input(Regex_Factory::COURSE_NUM_REGEX) {puts SECTION_NUM_ERRMSG}
        filter_hash["sec_num"] = input if input != ""
        mode_menu
        input = Safe_Input.safe_input(Regex_Factory::SECTION_MODE_REGEX) {puts SECTION_MODE_ERRMSG}
        filter_hash["mode"] = MODE_ENUM[input.to_i] if input != ""
        print "Building: "
        input = Safe_Input.safe_input(Regex_Factory::SECTION_BUILDING_REGEX) {puts SECTION_BUILDING_ERRMSG}
        filter_hash["building"] = input if input != ""
        print "Room Number: "
        input = Safe_Input.safe_input(Regex_Factory::SECTION_ROOM_REGEX) {puts SECTION_BUILDING_ERRMSG}
        filter_hash["room"] = input if input != ""
        print "Start Time(h:mm am/pm): "
        input = Safe_Input.safe_input(Regex_Factory::SECTION_TIME_REGEX) {puts SECTION_START_TIME_ERRMSG}
        filter_hash["start_time"] = input if input != ""
        print "End Time(h:mm am/pm): "
        input = Safe_Input.safe_input(Regex_Factory::SECTION_TIME_REGEX) {puts SECTION_END_TIME_ERRMSG}
        filter_hash["end_time"] = input if input != ""
        print "Days(ex. 'M W F'): "
        input = Safe_Input.safe_input(Regex_Factory::SECTION_DAYS_REGEX) {puts COURSE_HOURS_ERRMSG}
        filter_hash["days"] = input if input != ""
        term_menu
        input = Safe_Input.safe_input(Regex_Factory::SECTION_TERM_REGEX) {puts COURSE_HOURS_ERRMSG}
        filter_hash["term"] = TERM_ENUM[input.to_i] if input != ""
        location_menu
        input = Safe_Input.safe_input(Regex_Factory::SECTION_LOCATION_REGEX) {puts COURSE_HOURS_ERRMSG}
        filter_hash["city"] = CAMPUS_ENUM[input.to_i] if input != ""
        section_io filter_hash

    end
    private
    # Created 6/14/2022 by Jake McCann
    def menu_template
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
        puts "[2] View sections"
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

    def section_menu
        puts "All found sections are listed above"
        puts "\nEnter the number of what you want to do."
        puts "[2] Filter sections"
        puts "[1] Print current displayed sections to HTML"
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

    # Created 6/18/2022 by Noah Moon
    def mode_menu
        puts "\nEnter the number of the location filter value"
        puts "[1] Online"
        puts "[0] In person"
        puts "[ENTER] no selection"
    end

    # Created 6/18/2022 by Noah Moon
    def term_menu
        puts "\nEnter the number of the location filter value"
        puts "[2] Summer 2022"
        puts "[1] Autumn 2022"
        puts "[0] Spring 2022"
        puts "[ENTER] no selection"
    end

    # Created 6/18/2022 by Noah Moon
    def location_menu
        puts "\nEnter the number of the location filter value"
        puts "[5] Wooster"
        puts "[4] Newark"
        puts "[3] Marion"
        puts "[2] Mansfield"
        puts "[1] Lima"
        puts "[0] Columbus"
        puts "[ENTER] no selection"
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
    SECTION_NUM_ERRMSG = "Invalid filter value for section number, try again"
    SECTION_MODE_ERRMSG = "Invalid filter value for mode, try again"
    SECTION_BUILDING_ERRMSG = "Invalid filter value for building, try again"
    SECTION_BUILDING_ERRMSG = "Invalid filter value for room, try again"
    SECTION_START_TIME_ERRMSG = "Invalid filter value for start time, try again"
    SECTION_END_TIME_ERRMSG = "Invalid filter value for start time, try again"
end
