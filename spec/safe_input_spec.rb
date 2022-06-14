# Created 6/12/2022 by Jake McCann
# Edited 6/14/2022 by Jake McCann
require_relative '../lib/safe_input'

describe 'Safe_Input' do
  #Created 6/14/2022 by Jake McCann
  it 'returns inputted value when it is accepted by regex' do
    allow(STDIN).to receive(:gets).and_return "m\n"
    result = Safe_Input.safe_input /m/

    expect(result == "m").to be_truthy
  end

  #Created 6/14/2022 by Jake McCann
  it 'ignores inputted value when it is denied by regex' do
    allow(STDIN).to receive(:gets).and_return "n\n", "m\n"
    result = Safe_Input.safe_input /m/

    expect(result == "m").to be_truthy
  end

  #Created 6/14/2022 by Jake McCann
  it 'runs code block provided upon invalid input' do
    allow(STDIN).to receive(:gets).and_return "n\n", "m\n"
    expect{Safe_Input.safe_input(/m/) {$stdout.puts "ran"}}.to output(/ran/).to_stdout
  end

end
