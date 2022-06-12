# File created 6/8/2022 by Daniel Wu 
# File edited 6/11/2022 by Jake McCann
require_relative 'course_section_factory'
require_relative 'utility'

class User_Input

    # Created 6/8/2022 by Daniel Wu
    # Edited 6/11/2022 by Jake McCann: factory now created
    def initialize
        @data_factory = Course_Section_Factory.new
    end

    # Created 6/11/2022 by Jake McCann
    # Prompts user and gets input
    def main_menu_io
        main_menu
        input = STDIN.gets.chop
        case input
        when "0"
            return
        when "1"
            courses_io
        end
    end

    # Created 6/11/2022 by Jake McCann
    def courses_io
        system "clear"
        #TODO: print menu describing filters, get filters
        @data_factory.courses(nil).each{|course| puts(Utility.wrap_string "\n#{course.to_s}", 90)}
        courses_menu

        input = STDIN.gets.chomp
        case input
        when "0"
            main_menu_io
        when "1"
            #TODO: make call to serializer to output html
        end
    end

    private
    MENU_BORDER = '=' * 45
    # Created 6/11/2022 by Jake McCann
    def main_menu
        system "clear"
        puts MENU_BORDER
        puts "Welcome to the course navigator"
        puts "\nEnter the number of what you want to do."
        puts "[1] View courses"
        puts "[0] Quit"
        puts MENU_BORDER
    end

    #Created 6/12/2022 by Jake McCann
    def courses_menu
        puts MENU_BORDER
        puts "All CSE courses are listed above"
        puts "\nEnter the number of what you want to do."
        puts "[1] Print current displayed courses to HTML"
        puts "[0] Return to main menu"
        puts MENU_BORDER
    end

    # Created 6/9/2022 by Daniel Wu 
    # Returns a hash of desired filters from the user(or an empty hash if no filters)
    def get_filters
        puts "We currently have no filters implemented."
    end

end