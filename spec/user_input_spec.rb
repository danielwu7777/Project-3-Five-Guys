# File created 6/9/2022 by Daniel Wu
# File edited 6/11/2022 by Jake McCann
require_relative '../lib/course_section_factory'
require_relative '../lib/course'
require_relative '../lib/user_input'

describe 'User_Input' do
  #Created 6/11/2022 by Jake McCann
  it 'makes get call to correct url on courses_html' do
    fake_course = Course.new(nil, nil, nil, nil, nil)
    allow_any_instance_of(Course_Section_Factory).to receive(:courses).with(nil).and_return Array.new(1,fake_course)
    allow_any_instance_of(Course).to receive(:to_s).and_return("test")
    sut = User_Input.new

    expect(sut.courses_io).to output(/test/).to_stdout
  end
end