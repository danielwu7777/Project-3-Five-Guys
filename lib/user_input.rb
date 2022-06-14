# File created 6/8/2022 by Daniel Wu 
# File edited 6/11/2022 by Jake McCann
require_relative 'course_section_factory'
require_relative 'utility'
require_relative 'safe_input'
require_relative 'deserializer'
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
        case Safe_Input.menu_choice(%w[0 1]) { puts MENU_SELECTION_ERRMSG }
        when "0"
            return
        when "1"
            courses_io
        end
    end

    # Created 6/11/2022 by Jake McCann
    # Edited 6/13/2022 by Noah Moon
    def courses_io
        system "clear"
        #TODO: print menu describing filters, get filters
        @data_factory.courses(nil).each{|course| puts(Utility.wrap_string "\n#{course.to_s}", 90)}
        menu_template { courses_menu }

        case Safe_Input.menu_choice(%w[0 1]) { puts MENU_SELECTION_ERRMSG }
        when "0"
            main_io
        when "1"
            file_io
            Launchy.open("./Courses.html")
        end
    end

    #Created 6/14/2022 by Jake McCann
    def file_io
        system "clear"
        menu_template {file_menu}
        input = Safe_Input.output_file {puts MENU_SELECTION_ERRMSG}
        Deserializer.print_courses_file @data_factory.courses(nil), input if input != 0
    end

    private
    # Created 6/14/2022 by Jake McCann
    def menu_template
        puts MENU_BORDER
        yield if block_given?
        puts MENU_BORDER
        end
=begin
    Menus
=end
    # Created 6/11/2022 by Jake McCann
    def main_menu
        system "clear"
        puts "Welcome to the course navigator"
        puts "\nEnter the number of what you want to do."
        puts "[1] View courses"
        puts "[0] Quit"
    end

    #Created 6/12/2022 by Jake McCann
    def courses_menu
        puts "All CSE courses are listed above"
        puts "\nEnter the number of what you want to do."
        puts "[1] Print current displayed courses to HTML"
        puts "[0] Return to main menu"
    end

    #Created 6/14/2022 by Jake McCann
    def file_menu
        puts "Enter valid file name or path ending in .html"
        puts "[0] Return to main menu"
    end

=begin
    Constants
=end
    MENU_BORDER = '=' * 45
    MENU_SELECTION_ERRMSG = "Invalid input received, try again"
    FILE_NAME_ERRMSG = "Invalid file name or path, try again"
end
