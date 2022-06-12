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
    allow(STDIN).to receive(:gets).and_return "29\n", "1\n"
    result = Safe_Input.menu_choice options

    expect(result == "1").to be_truthy
  end

end
