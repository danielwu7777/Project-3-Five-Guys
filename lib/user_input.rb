# File created 6/8/2022 by Daniel Wu 
# File edited 6/11/2022 by Jake McCann
require_relative('course_section_factory')

class User_Input

    # Created 6/8/2022 by Daniel Wu
    # Edited 6/11/2022 by Jake McCann: factory now created
    def initialize
        @data_factory = Course_Section_Factory.new
    end

    # Created 6/11/2022 by Jake McCann
    # Prompts user and gets input
    def prompt_and_input
        puts "hello, here are the courses"
        getFilters
        puts "Here are the classes:"
        #TODO: pass in filter params after implemented
        @data_factory.courses(nil).each{|course| puts course}

    end

    # Created 6/9/2022 by Daniel Wu 
    # Returns a hash of desired filters from the user(or an empty hash if no filters) 
    def getFilters
        puts "We currently have no filters implemented."
        #TODO: Get all the filters from the user (or 0 for no filters)
    end

    private

end