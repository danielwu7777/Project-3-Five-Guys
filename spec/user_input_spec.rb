# File created 6/9/2022 by Daniel Wu
# File edited 6/11/2022 by Jake McCann
require_relative '../lib/course_section_factory'
require_relative '../lib/course'
require_relative '../lib/user_input'

describe 'User_Input' do

  #Created 6/11/2022 by Jake McCann
  it 'triggers courses menu when entering 1 in main menu' do

    allow(STDIN).to receive(:gets).and_return "1\n"
    allow_any_instance_of(User_Input).to receive(:courses_io) do
      puts "correct"
    end
    sut = User_Input.new

    expect{sut.main_menu_io}.to output(/correct/).to_stdout
  end

  #Created 6/11/2022 by Jake McCann
  it 'triggers main menu when entering 0 in courses menu' do
    allow(STDIN).to receive(:gets).and_return "0\n"
    allow_any_instance_of(User_Input).to receive(:main_menu_io) do
      puts "correct"
    end
    sut = User_Input.new

    expect{sut.courses_io}.to output(/correct/).to_stdout
  end

  #Created 6/11/2022 by Jake McCann
  it 'triggers main menu when entering 0 in courses menu' do
    allow(STDIN).to receive(:gets).and_return "0\n"
    allow_any_instance_of(User_Input).to receive(:main_menu_io) do
      puts "correct"
    end
    sut = User_Input.new

    expect{sut.courses_io}.to output(/correct/).to_stdout
  end

end