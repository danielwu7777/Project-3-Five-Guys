# File edited 6/11/2022 by Noah Moon

class Utility


  #Created 6/11/2022 by Noah Moon
  # Returns a new string which wraps line according to max_line
  def self.wrap_string(string, max_line)
    newString = String.new

    string.each_line do |line|
      if line.length > max_line
        temp_string = String.new
        while_count = 0

        while temp_string.length < line.length - max_line + 1
          while_count += 1
          temp_string += "#{line[(max_line*(while_count-1))...(max_line*while_count)]}\n"
        end
        temp_string += line[(while_count*max_line)...line.length]

        newString += temp_string
      else
        newString += line
      end
    end
    newString
  end
end
