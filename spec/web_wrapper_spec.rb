# File created 6/9/2022 by Daniel Wu
# File edited 6/9/2022 by Jake McCann
require 'mechanize'
require_relative '../lib/web_wrapper'

describe 'Web_Wrapper' do

  # Created 6/9/2022 by Jake McCann
  it 'makes get call to correct url on courses_html' do
    expected_url = "https://cse.osu.edu/courses"
    allow_any_instance_of(Mechanize).to receive(:get).with(expected_url).and_return Mechanize.new
    allow_any_instance_of(Mechanize).to receive(:body).and_return "correct url received"
    sut = Web_Wrapper.new

    result = sut.courses_html

    expect(result == "correct url received").to be_truthy
  end

  # Created 6/10/2022 by Jake McCann
  it 'grabs body(actual html) from mechanize return type' do
    fake_response = Mechanize.new()
    allow_any_instance_of(Mechanize).to receive(:get).and_return Mechanize.new
    allow_any_instance_of(Mechanize).to receive(:body).and_return "correctly grabbed body"
    sut = Web_Wrapper.new

    result = sut.courses_html

    expect(result == "correctly grabbed body").to be_truthy
  end

end
