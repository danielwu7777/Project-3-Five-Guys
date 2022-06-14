#Created 6/12/2022 by Jake McCann
#File edited 6/14/2022 by Jake McCann
class Safe_Input
  # Created 6/12/2022 by Jake McCann
  # Modified 6/14/2022 by Jake McCann consolidating safe input
  # Gets and returns valid file path
  # regex: regex expression used to determine what is valid input
  def self.safe_input regex
    input = STDIN.gets.chomp
    while !regex.match?(input)
      yield if block_given?
      input = STDIN.gets.chomp
    end
    input
  end
end
