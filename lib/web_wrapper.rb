# File created 6/9/2022 by Daniel Wu 
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# Edited 6/17/2022 by Noah Moon
# Edited 6/19/2022 by Noah Moon
require 'mechanize'

class Web_Wrapper

    # Created 6/9/2022 by Daniel Wu 
    def initialize
        # Create mechanize client instance (should be a singleton, should never be instantiated more than once)
        @web_client = Mechanize.new
    end

    # Created 6/9/2022 by Daniel Wu
    # Edited 6/9/2022 by Jake McCann: Implemented
    # Edited 6/19/2022 by Noah Moon
    # Return string of entire web page with all courses at https://cse.osu.edu/courses 
    def courses_html
        @web_client.get(COURSE_URL).body
    end

    # Created 6/9/2022 by Daniel Wu
    # Edited 6/17/2022 by Noah Moon
    # Edited 6/19/2022 by Noah Moon
    # Returns string containing all HTML for sections of class_num at https://classes.osu.edu/class-search/#/
    def sections_html(class_num)
        @web_client.get(SECTION_URL + class_num.to_s).body
                   .match(Regexp.new "(?<=\"sections\":).*\"catalogNumber\":\"#{class_num}\".*?(?={\"course\")").to_s
    end

    COURSE_URL = "https://cse.osu.edu/courses"
    SECTION_URL = "https://content.osu.edu/v2/classes/search?q=cse%20"
end
