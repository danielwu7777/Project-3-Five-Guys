# File created 6/9/2022 by Daniel Wu
# File edited 6/14/2022 by Noah Moon
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
    def sections_html(class_num)

        #page = @web_client.post("https://content.osu.edu/v2/classes/search?" "q" => "cse 2221", "client" => "class-search-ui", "campus" => "col", "term" => "1224").body
        @web_client.get("https://content.osu.edu/v2/classes/search?q=cse%202221&client=class-search-ui&campus=col&term=1224").body
    end

end

web = Web_Wrapper.new
puts web.sections_html 1
