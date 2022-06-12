#Craeted 6/12/2022 by Jake McCann
class Safe_Input

  #Created 6/12/2022 by Jake McCann
  #options: array of menu options that are valid
  def self.menu_choice(options)
    input = STDIN.gets.chomp
    while !options.include? input do
      STDOUT.puts "invalid input received, try again"
      input = STDIN.gets.chomp
    end
    input
  end
end
