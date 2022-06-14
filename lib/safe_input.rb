#Created 6/12/2022 by Jake McCann
#File edited 6/14/2022 by Jake McCann
class Safe_Input

  # Created 6/12/2022 by Jake McCann
  # Modified 6/14/2022 by Jake McCann consolidating safe input into one method
  # Gets and returns user menu choice
  # options: array of menu options that are valid
  def self.menu_choice(options)
    input = STDIN.gets.chomp
    while !options.include? input do
      yield if block_given?
      input = STDIN.gets.chomp
    end
    input
  end

  # Created 6/12/2022 by Jake McCann
  # Gets and returns hash containing filter parms
  def self.filter
    #TODO: implement after figuring out what filter params need to look like
  end

  # Created 6/12/2022 by Jake McCann
  # Gets and returns valid file path
  def self.output_file
    input = STDIN.gets.chomp
    while !/^(\/[a-z_\-\s0-9\.]+)*\w+\.html/.match?(input)
      yield if block_given?
      input = STDIN.gets.chomp
    end
    input
  end
end
