# File Created 6/11/2022 by Noah Moon
# File Edited 6/12/2022 by Noah Moon
require_relative '../lib/utility'
describe 'utility' do

  test_desc = "Spreadsheet and database modeling/programming concepts and techniques to solve business and engineering related problems; efficient/effective data handling, computational analysis and decision support."
  # Created 6/11/2022 by Noah Moon
  it 'wrap_string returns same line if < max length' do
    string_exp = "this is less than max"
    string_test = Utility.wrap_string string_exp, 25
    expect(string_exp == string_test).to be_truthy
  end

  # Created 6/11/2022 by Noah Moon
  it 'wrap_string returns 2 lines with spaces if > max length' do
    string = "this is over max_line"
    string_exp = "this is over \nmax_line"
    string_test = Utility.wrap_string string, 13
    expect(string_exp == string_test).to be_truthy
  end

  # Created 6/11/2022 by Noah Moon
  it 'wrap_string returns 2 lines no spaces if > max length' do
    string = "1111111111"
    string_exp = "11111\n11111"
    string_test = Utility.wrap_string string, 5
    expect(string_exp == string_test).to be_truthy
  end

  # Created 6/11/2022 by Noah Moon
  it 'real description' do
    string_exp = "Spreadsheet and database \nmodeling/programming concepts \nand techniques to solve \n"\
"business and engineering \nrelated problems; \nefficient/effective data \nhandling, computational \n"\
"analysis and decision support."
    string_test = Utility.wrap_string test_desc, 30
    expect(string_exp == string_test).to be_truthy
  end


end
