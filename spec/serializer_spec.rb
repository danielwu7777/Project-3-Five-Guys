require_relative '../lib/serializer'
require_relative '../lib/course'
# File created 6/9/2022 by Jake McCann
# Edited 6/10/2022 by Noah Moon

test_html1 = "<h4 class='title'><span class='title'>Modeling and Problem Solving with Spreadsheets and Databases for Engineers</span> <span class='number'>(2112)</span></h4>
<p class='description'><span class='label'>Description:</span> Spreadsheet and database modeling/programming concepts and techniques to solve business and engineering related problems; efficient/effective data handling, computational analysis and decision support.<br />
Prereq: 1222, 1223, 1224, Engr 1281.01H, or 1281.02H. Prereq or concur: Math 1151, 1161.01, or 1161.02. Not open to students with credit for 1111, 1112, 1113, or 2111. <span class='label'>Units:</span> 3</p>
<p class='subject'><span class='label'>Subject: </span>Computer Science and Engineering</p></div>"
title1 = "Modeling and Problem Solving with Spreadsheets and Databases for Engineers"
num1 = "2112"
desc1 = "Spreadsheet and database modeling/programming concepts and techniques to solve business and engineering related problems; efficient/effective data handling, computational analysis and decision support."
prereq1 = "Prereq: 1222, 1223, 1224, Engr 1281.01H, or 1281.02H. Prereq or concur: Math 1151, 1161.01, or 1161.02. Not open to students with credit for 1111, 1112, 1113, or 2111."
hours1 = "3"

test_html2 = '<h4 class="title"><span class="title">Introduction to Computing Technology</span> <span class="number">(1110)</span></h4>
<p class="description"><span class="label">Description:</span> A course of general interest giving experience with personal computer software, e.g., word processors and spreadsheets; provides fundamental computer literacy; neither teaches nor requires programming.<br>
Prereq: Not open to students with credit for 1111 or 1113. <span class="label">Units:</span> 3</p>
<p class="subject"><span class="label">Subject: </span>Computer Science and Engineering</p></div>'
title2 = "Introduction to Computing Technology"
num2 = "1110"
desc2 = "A course of general interest giving experience with personal computer software, e.g., word processors and spreadsheets; provides fundamental computer literacy; neither teaches nor requires programming."
prereq2 = "Prereq: Not open to students with credit for 1111 or 1113."
hours2 = "3"

test_html3 = '<h4 class="title"><span class="title">Reverse Engineering and Malware Analysis</span> <span class="number">(5477.02)</span></h4>
<p class="description"><span class="label">Description:</span> This course will give students an overview of cutting edge reverse engineering techniques as well as software security and defense practices. Programming experience in C required.<br>
Prereq: 2431, 5431, or Grad standing. Prereq or concur: 5471 or ECE 5561. Not open to students with credit for ECE 5567.02. Cross-listed in ECE 5567.02. <span class="label">Units:</span> 3</p>
<p class="subject"><span class="label">Subject: </span>Computer Science and Engineering</p>'
title3 = "Reverse Engineering and Malware Analysis"
num3 = "5477.02"
desc3 = "This course will give students an overview of cutting edge reverse engineering techniques as well as software security and defense practices. Programming experience in C required."
prereq3 = "Prereq: 2431, 5431, or Grad standing. Prereq or concur: 5471 or ECE 5561. Not open to students with credit for ECE 5567.02. Cross-listed in ECE 5567.02."
hours3 = "3"

describe 'Serializer' do

  # Created 6/10/2022 by Noah Moon
  it 'gets title from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    title = course_list[0].course_title

    expect(title == title1).to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets number from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    num = course_list[0].course_num

    expect(num == num1).to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets description from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    desc = course_list[0].description

    expect(desc == desc1).to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets prereqs from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    prereqs = course_list[0].prereqs

    expect(prereqs == prereq1).to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets hours from 1 item' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list
    hours = course_list[0].hours
    expect(hours == hours1).to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets all attributes from 1 class' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list

    title = course_list[0].course_title
    num = course_list[0].course_num
    desc = course_list[0].description
    prereqs = course_list[0].prereqs
    hours = course_list[0].hours

    expect(title == title1).to be_truthy
    expect(num == num1).to be_truthy
    expect(desc == desc1).to be_truthy
    expect(prereqs == prereq1).to be_truthy
    expect(hours == hours1).to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets all attributes from 2 classes' do
    html_list = Array.new
    html_list.push test_html2
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list

    title = course_list[0].course_title
    num = course_list[0].course_num
    desc = course_list[0].description
    prereqs = course_list[0].prereqs
    hours = course_list[0].hours

    expect(title == title1).to be_truthy
    expect(num == num1).to be_truthy
    expect(desc == desc1).to be_truthy
    expect(prereqs == prereq1).to be_truthy
    expect(hours == hours1).to be_truthy

    title = course_list[1].course_title
    num = course_list[1].course_num
    desc = course_list[1].description
    prereqs = course_list[1].prereqs
    hours = course_list[1].hours

    expect(title == title2).to be_truthy
    expect(num == num2).to be_truthy
    expect(desc == desc2).to be_truthy
    expect(prereqs == prereq2).to be_truthy
    expect(hours == hours2).to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  it 'gets all attributes from 2 classes' do
    html_list = Array.new
    html_list.push test_html3
    html_list.push test_html2
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list

    title = course_list[0].course_title
    num = course_list[0].course_num
    desc = course_list[0].description
    prereqs = course_list[0].prereqs
    hours = course_list[0].hours

    expect(title == title1).to be_truthy
    expect(num == num1).to be_truthy
    expect(desc == desc1).to be_truthy
    expect(prereqs == prereq1).to be_truthy
    expect(hours == hours1).to be_truthy

    title = course_list[1].course_title
    num = course_list[1].course_num
    desc = course_list[1].description
    prereqs = course_list[1].prereqs
    hours = course_list[1].hours

    expect(title == title2).to be_truthy
    expect(num == num2).to be_truthy
    expect(desc == desc2).to be_truthy
    expect(prereqs == prereq2).to be_truthy
    expect(hours == hours2).to be_truthy

    title = course_list[2].course_title
    num = course_list[2].course_num
    desc = course_list[2].description
    prereqs = course_list[2].prereqs
    hours = course_list[2].hours

    expect(title == title3).to be_truthy
    expect(num == num3).to be_truthy
    expect(desc == desc3).to be_truthy
    expect(prereqs == prereq3).to be_truthy
    expect(hours == hours3).to be_truthy
  end

end

