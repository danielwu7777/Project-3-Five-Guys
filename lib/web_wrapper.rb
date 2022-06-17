# File created 6/9/2022 by Daniel Wu
# File edited 6/14/2022 by Noah Moon
# File edited 6/17/2022 by Noah Moon
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
    # Edited 6/17/2022 by Noah Moon: added implementation
    # Returns string containing all data for sections of class_num
    def sections_html(class_num)
       @web_client.get("https://content.osu.edu/v2/classes/search?q=cse%20#{class_num}").body
                          .match(Regexp.new "(?<=\"sections\":).*\"catalogNumber\":\"#{class_num}\".*?(?={\"course\")").to_s
    end

end

=begin
file = File.new "./test.txt", "w"
web = Web_Wrapper.new
x =  web.sections_html 2221
array = Array.new
x.scan(/(?<={)"classNumber".*?(?="termCode")/) { |match|  array.push match}
puts array[0].to_s
=end