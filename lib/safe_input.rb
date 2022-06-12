#Craeted 6/12/2022 by Jake McCann
class Safe_Input

  #Created 6/12/2022 by Jake McCann
  # Gets and returns user menu choice
  # options: array of menu options that are valid
  def self.menu_choice(options)
    input = STDIN.gets.chomp
    while !options.include? input do
      STDOUT.puts "invalid input received, try again"
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
    puts "Please enter output file name or path/name relative to current directory"
    input = STDIN.gets.chomp
    while !/^(\/[a-z_\-\s0-9\.]+)*\w+\.html/.match?(input)
      STDOUT.puts "invalid file name received, try again"
      input = STDIN.gets.chomp
    end
    input
  end
end
