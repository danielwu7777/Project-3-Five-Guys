#Created 6/12/2022 by Jake McCann
require_relative '../lib/safe_input'

describe 'Safe_Input' do

  #Created 6/12/2022 by Jake McCann
  it 'returns entered value on proper input for menu option choice' do
    options = %w[0 1 2]
    allow(STDIN).to receive(:gets).and_return "0\n"
    result = Safe_Input.menu_choice options

    expect(result == "0").to be_truthy
  end

  it 'returns second input when user first inputs invalid menu option choice' do
    options = %w[0 1 2]
    allow(STDIN).to receive(:gets).and_return "29\n", "1\n"
    result = Safe_Input.menu_choice options

    expect(result == "1").to be_truthy
  end

  it 'returns third input when user inputs 2 invalid invalid menu option choices' do
    options = %w[0 1 2]
    allow(STDIN).to receive(:gets).and_return "29\n", "bruh\n", "1\n"
    result = Safe_Input.menu_choice options

    expect(result == "1").to be_truthy
  end

  it 'returns correct inputted filename' do
    allow(STDIN).to receive(:gets).and_return "b_ruh321.html\n"
    result = Safe_Input.output_file

    expect(result == "b_ruh321.html").to be_truthy
  end

  it 'returns second file name when first is missing .html' do
    allow(STDIN).to receive(:gets).and_return "bruh\n", "bruh.html\n"
    result = Safe_Input.output_file

    expect(result == "bruh.html").to be_truthy
  end

  it 'returns second file name when first uses wrong slashes' do
    allow(STDIN).to receive(:gets).and_return "\\wrong\\slash\\test.html\n", "bruh.html\n"
    result = Safe_Input.output_file

    expect(result == "bruh.html").to be_truthy
  end

  it 'returns input that is file path followed by html file name' do
    allow(STDIN).to receive(:gets).and_return "/correct/path/test.html\n", "bruh.html\n"
    result = Safe_Input.output_file

    expect(result == "/correct/path/test.html").to be_truthy
  end

  it 'ignores file name with invalid characters' do
    illegal_filenames = %w[# = - < > % & * ? { } / \ \   @ : " ' ! $ ` | ' "].map! { |char| "#{char}.html"}
    allow(STDIN).to receive(:gets).and_return *illegal_filenames, "bruh.html\n"
    result = Safe_Input.output_file

    expect(result == "bruh.html").to be_truthy
  end

  it 'ignores directory name with invalid characters' do
    illegal_filenames = %w[# = - < > % & * ? { } / \ \   @ : " ' ! $ ` | ' "].map! { |char| "#{char}/wrong.html"}
    allow(STDIN).to receive(:gets).and_return *illegal_filenames, "bruh.html\n"
    result = Safe_Input.output_file

    expect(result == "bruh.html").to be_truthy
  end

end
