#Created 6/12/2022 by Jake McCann
#File edited 6/14/2022 by Jake McCann
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# File edited 6/18/2022 by Noah Moon
class Safe_Input
  # Created 6/12/2022 by Jake McCann
  # Modified 6/14/2022 by Jake McCann consolidating safe input
=begin
  # Gets and returns valid input based on regex
  # regex: regex expression used to determine what is valid input
=end
def self.safe_input regex
    input = STDIN.gets.chomp
    while !regex.match? input
      yield if block_given?
      input = STDIN.gets.chomp
    end
    input
  end
end
