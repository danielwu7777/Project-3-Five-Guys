# File created 6/11/2022 by Noah Moon
# File edited 6/12/2022 by Noah Moon
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
require 'set'

class Utility
  # Created 6/11/2022 by Noah Moon
  # Edited 6/12/2022 by Noah Moon
  # Returns a new string which wraps line according to max_line
  def self.wrap_string string, max_line, break_chars = Set[" "]
    newString = String.new

    string.each_line do |line|
      if line.length > max_line
        temp_string = String.new
        new_char_count = 0
        last_index = 0
        while temp_string.length - new_char_count < line.length - max_line
          new_char_count += 1
          last_space_index = last_index + max_line - 1 # sets default to max length

          line[last_index...last_index+max_line].each_char.with_index{|char ,index|
            last_space_index = index + last_index if break_chars.include? char} # searches for breaks

          temp_string += "#{line[last_index..last_space_index]}\n" # adds up to break
          last_index = last_space_index + 1 # starts at index after break
        end
        temp_string += "#{line[last_index...line.length]}" # adds remaining string
        newString += temp_string
      else
        newString += line
      end
    end
    newString
  end
end

