require_relative '../lib/Utility'
describe 'Utility' do

  # Created 6/10/2022 by Noah Moon
  it 'wrap_string returns same line if < max length' do
    string_exp = "this is less than max"
    string_test = Utility.wrap_string string_exp, 25
    expect(string_exp == string_test).to be_truthy
  end

  it 'wrap_string returns 2 lines if > max length' do
    string = "this is over max_line"
    string_exp = "this is over \nmax_line"
    string_test = Utility.wrap_string string, 13
    expect(string_exp == string_test).to be_truthy
  end

end
