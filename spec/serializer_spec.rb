require_relative '../lib/serializer'
require_relative '../lib/course'
# File created 6/9/2022 by Jake McCann
# Edited 6/10/2022 by Noah Moon

test_html1 = "<h4 class='title'><span class='title'>Modeling and Problem Solving with Spreadsheets and Databases for Engineers</span> <span class='number'>(2112)</span></h4>
<p class='description'><span class='label'>Description:</span> Spreadsheet and database modeling/programming concepts and techniques to solve business and engineering related problems; efficient/effective data handling, computational analysis and decision support.<br />
Prereq: 1222, 1223, 1224, Engr 1281.01H, or 1281.02H. Prereq or concur: Math 1151, 1161.01, or 1161.02. Not open to students with credit for 1111, 1112, 1113, or 2111. <span class='label'>Units:</span> 3</p>
<p class='subject'><span class='label'>Subject: </span>Computer Science and Engineering</p></div>"

describe 'Serializer' do

  # Created 6/10/2022 by Noah Moon
  it 'gets title from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    title = course_list[0].course_title
    expect(title == "Modeling and Problem Solving with Spreadsheets and Databases for Engineers").to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets number from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    num = course_list[0].course_num
    expect(num == "2112").to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets description from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    desc = course_list[0].description
    expect(desc == "Spreadsheet and database modeling/programming concepts and techniques to solve business and engineering related problems; efficient/effective data handling, computational analysis and decision support.").to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets prereqs from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    prereqs = course_list[0].prereqs
    expect(prereqs == "Prereq: 1222, 1223, 1224, Engr 1281.01H, or 1281.02H. Prereq or concur: Math 1151, 1161.01, or 1161.02. Not open to students with credit for 1111, 1112, 1113, or 2111.").to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets hours from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    hours = course_list[0].hours
    expect(hours == "3").to be_truthy
  end


end

