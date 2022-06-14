# File created 6/11/2022 by Noah Moon
# File edited 6/12/2022 by Noah Moon
require 'set'

class Utility

=begin
     Returns a new string which wraps line according to max_line

     Parameters:
      - string: String - the string to format (remains unchanged)
      - max_line: Integer - max number of characters per line
      - break_chars: Set - set of seperators that a new line will be created from (optional, space by default)

     Algorithm:
       1. loops through each line
       2. if line <= max_length, it is not changed
       3. if line > max_length,
             3a. line is broken in piece of length max_length
             3b. last separator (nearest to max_length) is found
             3c. the line is added up to the last separator and a newline is added
             3d. repeat 3a-3c until there are less than max_length characters to check
             3e. add remaining part of line
        4. new formatted string is returned
=end
  # Created 6/11/2022 by Noah Moon
  # Edited 6/12/2022 by Noah Moon
  def self.wrap_string string, max_line, break_chars = Set[" "]
    newString = String.new

    string.each_line do |line|
      if line.length > max_line
        temp_string = String.new
        new_char_count, last_index = 0, 0
        while temp_string.length - new_char_count < line.length - max_line
          new_char_count += 1
          last_space_index = last_index + max_line - 1

          line[last_index...last_index+max_line].each_char.with_index{|char ,index|
            last_space_index = index + last_index if break_chars.include? char}

          temp_string += "#{line[last_index..last_space_index]}\n"
          last_index = last_space_index + 1
        end
        temp_string += "#{line[last_index...line.length]}"
        newString += temp_string
      else
        newString += line
      end
    end
    newString
  end
end

