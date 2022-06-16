# File created 6/9/2022 by Daniel Wu 
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
require 'mechanize'

class Web_Wrapper

    # Created 6/9/2022 by Daniel Wu 
    def initialize
        # Create mechanize client instance (should be a singleton, should never be instantiated more than once)
        @web_client = Mechanize.new
    end

    # Created 6/9/2022 by Daniel Wu
    # Edited 6/9/2022 by Jake McCann: Implemented
    # Return string of entire web page with all courses at https://cse.osu.edu/courses 
    def courses_html
        @web_client.get("https://cse.osu.edu/courses").body
    end

    # Created 6/9/2022 by Daniel Wu
    # Returns string containing all HTML for sections of class_num at https://classes.osu.edu/class-search/#/
    def sections_html class_num

    end

end
