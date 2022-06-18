require_relative '../lib/serializer'
require_relative '../lib/course'
require_relative '../lib/section'
# File created 6/9/2022 by Jake McCann
# Edited 6/10/2022 by Noah Moon
# Edited 6/11/2022 by Noah Moon

test_html1 = "<h4 class='title'><span class='title'>Modeling and Problem Solving with Spreadsheets and Databases for Engineers</span> <span class='number'>(2112)</span></h4><p class='description'><span class='label'>Description:</span> Spreadsheet and database modeling/programming concepts and techniques to solve business and engineering related problems; efficient/effective data handling, computational analysis and decision support.<br />Prereq: 1222, 1223, 1224, Engr 1281.01H, or 1281.02H. Prereq or concur: Math 1151, 1161.01, or 1161.02. Not open to students with credit for 1111, 1112, 1113, or 2111. <span class='label'>Units:</span> 3</p><p class='subject'><span class='label'>Subject: </span>Computer Science and Engineering</p></div>"
title1 = "Modeling and Problem Solving with Spreadsheets and Databases for Engineers"
num1 = "2112"
desc1 = "Spreadsheet and database modeling/programming concepts and techniques to solve business and engineering related problems; efficient/effective data handling, computational analysis and decision support."
prereq1 = "1222, 1223, 1224, Engr 1281.01H, or 1281.02H. Prereq or concur: Math 1151, 1161.01, or 1161.02. Not open to students with credit for 1111, 1112, 1113, or 2111."
hours1 = "3"

test_html2 = '<h4 class="title"><span class="title">Introduction to Computing Technology</span> <span class="number">(1110)</span></h4><p class="description"><span class="label">Description:</span> A course of general interest giving experience with personal computer software, e.g., word processors and spreadsheets; provides fundamental computer literacy; neither teaches nor requires programming.<br>Prereq: Not open to students with credit for 1111 or 1113. <span class="label">Units:</span> 3</p><p class="subject"><span class="label">Subject: </span>Computer Science and Engineering</p></div>'
title2 = "Introduction to Computing Technology"
num2 = "1110"
desc2 = "A course of general interest giving experience with personal computer software, e.g., word processors and spreadsheets; provides fundamental computer literacy; neither teaches nor requires programming."
prereq2 = "Not open to students with credit for 1111 or 1113."
hours2 = "3"

test_html3 = '<h4 class="title"><span class="title">Reverse Engineering and Malware Analysis</span> <span class="number">(5477.02)</span></h4><p class="description"><span class="label">Description:</span> This course will give students an overview of cutting edge reverse engineering techniques as well as software security and defense practices. Programming experience in C required.<br>Prereq: 2431, 5431, or Grad standing. Prereq or concur: 5471 or ECE 5561. Not open to students with credit for ECE 5567.02. Cross-listed in ECE 5567.02. <span class="label">Units:</span> 3</p><p class="subject"><span class="label">Subject: </span>Computer Science and Engineering</p>'
title3 = "Reverse Engineering and Malware Analysis"
num3 = "5477.02"
desc3 = "This course will give students an overview of cutting edge reverse engineering techniques as well as software security and defense practices. Programming experience in C required."
prereq3 = "2431, 5431, or Grad standing. Prereq or concur: 5471 or ECE 5561. Not open to students with credit for ECE 5567.02. Cross-listed in ECE 5567.02."
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
  # Edited 6/11/2022 by Noah Moon
  it 'gets all attributes from 1 class' do
    html_list = Array.new
    html_list.push test_html1

    course_list = Serializer.serialize_courses html_list

    title, num, desc, prereqs, hours = course_list[0].course_title, course_list[0].course_num, course_list[0].description, course_list[0].prereqs, course_list[0].hours
    expect(title == title1 && num == num1 && desc == desc1 && prereqs == prereq1 && hours == hours1 ).to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  # Edited 6/11/2022 by Noah Moon
  it 'gets all attributes from 2 classes' do
    html_list = [test_html2,test_html1]

    course_list = Serializer.serialize_courses html_list

    title, num, desc, prereqs, hours = course_list[0].course_title, course_list[0].course_num, course_list[0].description, course_list[0].prereqs, course_list[0].hours
    expect(title == title1 && num == num1 && desc == desc1 && prereqs == prereq1 && hours == hours1 ).to be_truthy

    title, num, desc, prereqs, hours = course_list[1].course_title, course_list[1].course_num, course_list[1].description, course_list[1].prereqs, course_list[1].hours
    expect(title == title2 && num == num2 && desc == desc2 && prereqs == prereq2 && hours == hours2).to be_truthy
  end

  # Created 6/10/2022 by Noah Moon
  # Edited 6/11/2022 by Noah Moon
  it 'gets all attributes from 2 classes' do
    html_list = [test_html3,test_html2,test_html1]

    course_list = Serializer.serialize_courses html_list

    title, num, desc, prereqs, hours = course_list[0].course_title, course_list[0].course_num, course_list[0].description, course_list[0].prereqs, course_list[0].hours
    expect(title == title1 && num == num1 && desc == desc1 && prereqs == prereq1 && hours == hours1 ).to be_truthy

    title, num, desc, prereqs, hours = course_list[1].course_title, course_list[1].course_num, course_list[1].description, course_list[1].prereqs, course_list[1].hours
    expect(title == title2 && num == num2 && desc == desc2 && prereqs == prereq2 && hours == hours2).to be_truthy

    title, num, desc, prereqs, hours = course_list[2].course_title, course_list[2].course_num, course_list[2].description, course_list[2].prereqs, course_list[2].hours
    expect(title == title3 && num == num3 && desc == desc3 && prereqs == prereq3 && hours == hours3).to be_truthy

  end

  it 'gets all section attributes from 1 classes' do
    section_raw_test = '"classNumber":"24868","section":"0005","component":"Lecture","instructionMode":"In Person","meetings":[{"meetingNumber":1,"facilityId":"DL0357","facilityType":"1B","facilityDescription":"Dreese Laboratories","facilityDescriptionShort":"Dreese Lab","facilityGroup":false,"facilityCapacity":46,"buildingCode":"279","room":"357","buildingDescription":"Dreese Lab 357","buildingDescriptionShort":"DL 357","startTime":"8:00 am","endTime":"8:55 am","startDate":"2022-01-10","endDate":"2022-04-25","monday":false,"tuesday":true,"wednesday":false,"thursday":true,"friday":false,"saturday":false,"sunday":false,"standingMeetingPattern":null,"instructors":[{"displayName":"Veronica Sarah Thai","role":"PI","email":"thai.53@osu.edu"}]}],"courseOfferingNumber":1,"courseId":"150505","academicGroup":"ENG","subject":"Computer Science & Engineering","catalogNumber":"2221","career":"UGRD","description":"SW 1: Components","enrollmentStatus":"Open","status":"A","type":"E","associatedClass":"5","autoEnrollWaitlist":true,"autoEnrollSection1":"0006","autoEnrollSection2":null,"consent":false,"waitlistCapacity":999,"minimumEnrollment":0,"enrollmentTotal":39,"waitlistTotal":0,"academicOrg":"D1435","location":"CS-COLMBUS","equivalentCourseId":null,"startDate":"2022-01-10","endDate":"2022-04-25","cancelDate":null,"primaryInstructorSection":"0005","combinedSection":null,"holidaySchedule":"OSUSIS","sessionCode":"1","sessionDescription":"Regular Academic Term","term":"Spring 2022","campus":"Columbus","attributes":[{"name":"CCP","value":"LEVEL 1","description":"Level 1 CCP course"},{"name":"EXAM","value":"DEPT","description":"EM test administered by department of instruction"}],"secCampus":"COL","secAcademicGroup":"ENG","secCatalogNumber":"2221","meetingDays":"","_parent":"150505-1-1222","subjectDesc":"Computer Science & Engineering","courseTitle":"Software I: Software Components","courseDescription":"Intellectual foundations of software engineering; design-by-contract principles; mathematical modeling of software functionality; component-based software from client perspective; layered data representation.\nPrereq: 1212, 1221, 1222, 1223, 1224, Engr 1221, 1281.01H, 1281.02H, or CSE Placement Level A. Prereq or concur: Math 1151, 1161.01, or 1161.02. Not open to students with credit for 5022. This course is available for EM credit.","catalogLevel":"2xxx","termCode"'
    test_list = [section_raw_test]
    expected = Section.new "0005", "Spring 2022", "In Person", "Columbus","Dreese Lab",
                           "357", "Tu Th ", "8:00 am", "8:55 am"
    section_list = Serializer.serialize_sections test_list
    puts section_list[0].title.to_s
    puts expected.title.to_s

    expect(expected.section_num == section_list[0].section_num.to_s &&
             expected.term == section_list[0].term.to_s &&
             expected.mode == section_list[0].mode.to_s &&
             expected.city == section_list[0].city.to_s &&
             expected.building == section_list[0].building.to_s &&
             expected.room == section_list[0].room.to_s &&
             expected.days == section_list[0].days.to_s &&
             expected.start_time == section_list[0].start_time.to_s &&
             expected.end_time == section_list[0].end_time.to_s &&
             expected.title == section_list[0].title.to_s).to be_truthy

  end

  it 'gets all section attributes from 2 classes' do
    section_raw_test1 = '"classNumber":"24868","section":"0005","component":"Lecture","instructionMode":"In Person","meetings":[{"meetingNumber":1,"facilityId":"DL0357","facilityType":"1B","facilityDescription":"Dreese Laboratories","facilityDescriptionShort":"Dreese Lab","facilityGroup":false,"facilityCapacity":46,"buildingCode":"279","room":"357","buildingDescription":"Dreese Lab 357","buildingDescriptionShort":"DL 357","startTime":"8:00 am","endTime":"8:55 am","startDate":"2022-01-10","endDate":"2022-04-25","monday":false,"tuesday":true,"wednesday":false,"thursday":true,"friday":false,"saturday":false,"sunday":false,"standingMeetingPattern":null,"instructors":[{"displayName":"Veronica Sarah Thai","role":"PI","email":"thai.53@osu.edu"}]}],"courseOfferingNumber":1,"courseId":"150505","academicGroup":"ENG","subject":"Computer Science & Engineering","catalogNumber":"2221","career":"UGRD","description":"SW 1: Components","enrollmentStatus":"Open","status":"A","type":"E","associatedClass":"5","autoEnrollWaitlist":true,"autoEnrollSection1":"0006","autoEnrollSection2":null,"consent":false,"waitlistCapacity":999,"minimumEnrollment":0,"enrollmentTotal":39,"waitlistTotal":0,"academicOrg":"D1435","location":"CS-COLMBUS","equivalentCourseId":null,"startDate":"2022-01-10","endDate":"2022-04-25","cancelDate":null,"primaryInstructorSection":"0005","combinedSection":null,"holidaySchedule":"OSUSIS","sessionCode":"1","sessionDescription":"Regular Academic Term","term":"Spring 2022","campus":"Columbus","attributes":[{"name":"CCP","value":"LEVEL 1","description":"Level 1 CCP course"},{"name":"EXAM","value":"DEPT","description":"EM test administered by department of instruction"}],"secCampus":"COL","secAcademicGroup":"ENG","secCatalogNumber":"2221","meetingDays":"","_parent":"150505-1-1222","subjectDesc":"Computer Science & Engineering","courseTitle":"Software I: Software Components","courseDescription":"Intellectual foundations of software engineering; design-by-contract principles; mathematical modeling of software functionality; component-based software from client perspective; layered data representation.\nPrereq: 1212, 1221, 1222, 1223, 1224, Engr 1221, 1281.01H, 1281.02H, or CSE Placement Level A. Prereq or concur: Math 1151, 1161.01, or 1161.02. Not open to students with credit for 5022. This course is available for EM credit.","catalogLevel":"2xxx","termCode"'
    section_raw_test2 = '"classNumber":"24868","section":"0010","component":"Lecture","instructionMode":"Online","meetings":[{"meetingNumber":1,"facilityId":"DL0357","facilityType":"1B","facilityDescription":"Dreese Laboratories","facilityDescriptionShort":"Dreese Lab","facilityGroup":false,"facilityCapacity":46,"buildingCode":"279","room":"420","buildingDescription":"Scott lab 357","buildingDescriptionShort":"DL 357","startTime":"10:00 am","endTime":"12:55 pm","startDate":"2022-01-10","endDate":"2022-04-25","monday":true,"tuesday":true,"wednesday":true,"thursday":true,"friday":true,"saturday":false,"sunday":false,"standingMeetingPattern":null,"instructors":[{"displayName":"Veronica Sarah Thai","role":"PI","email":"thai.53@osu.edu"}]}],"courseOfferingNumber":1,"courseId":"150505","academicGroup":"ENG","subject":"Computer Science & Engineering","catalogNumber":"2221","career":"UGRD","description":"SW 1: Components","enrollmentStatus":"Open","status":"A","type":"E","associatedClass":"5","autoEnrollWaitlist":true,"autoEnrollSection1":"0006","autoEnrollSection2":null,"consent":false,"waitlistCapacity":999,"minimumEnrollment":0,"enrollmentTotal":39,"waitlistTotal":0,"academicOrg":"D1435","location":"CS-COLMBUS","equivalentCourseId":null,"startDate":"2022-01-10","endDate":"2022-04-25","cancelDate":null,"primaryInstructorSection":"0005","combinedSection":null,"holidaySchedule":"OSUSIS","sessionCode":"1","sessionDescription":"Regular Academic Term","term":"Fall 2022","campus":"Newark","attributes":[{"name":"CCP","value":"LEVEL 1","description":"Level 1 CCP course"},{"name":"EXAM","value":"DEPT","description":"EM test administered by department of instruction"}],"secCampus":"COL","secAcademicGroup":"ENG","secCatalogNumber":"2221","meetingDays":"","_parent":"150505-1-1222","subjectDesc":"Computer Science & Engineering","courseTitle":"Software I: Software Components","courseDescription":"Intellectual foundations of software engineering; design-by-contract principles; mathematical modeling of software functionality; component-based software from client perspective; layered data representation.\nPrereq: 1212, 1221, 1222, 1223, 1224, Engr 1221, 1281.01H, 1281.02H, or CSE Placement Level A. Prereq or concur: Math 1151, 1161.01, or 1161.02. Not open to students with credit for 5022. This course is available for EM credit.","catalogLevel":"2xxx","termCode"'
    test_list = [section_raw_test2, section_raw_test1]
    expected = Array.new
    expected[0] = Section.new "0005", "Spring 2022", "In Person", "Columbus","Dreese Lab",
                           "357", "Tu Th ", "8:00 am", "8:55 am"
    expected[1] = Section.new "0010", "Fall 2022", "Online", "Newark","Scott lab",
                              "420", "M Tu W Th F ", "10:00 am", "12:55 pm"
    section_list = Serializer.serialize_sections test_list

    expect(expected[0].section_num == section_list[0].section_num.to_s &&
             expected[0].term == section_list[0].term.to_s &&
             expected[0].mode == section_list[0].mode.to_s &&
             expected[0].city == section_list[0].city.to_s &&
             expected[0].building == section_list[0].building.to_s &&
             expected[0].room == section_list[0].room.to_s &&
             expected[0].days == section_list[0].days.to_s &&
             expected[0].start_time == section_list[0].start_time.to_s &&
             expected[0].end_time == section_list[0].end_time.to_s &&
             expected[0].title == section_list[0].title.to_s).to be_truthy

    expect(expected[1].section_num == section_list[1].section_num.to_s &&
             expected[1].term == section_list[1].term.to_s &&
             expected[1].mode == section_list[1].mode.to_s &&
             expected[1].city == section_list[1].city.to_s &&
             expected[1].building == section_list[1].building.to_s &&
             expected[1].room == section_list[1].room.to_s &&
             expected[1].days == section_list[1].days.to_s &&
             expected[1].start_time == section_list[1].start_time.to_s &&
             expected[1].end_time == section_list[1].end_time.to_s &&
             expected[1].title == section_list[1].title.to_s).to be_truthy
  end

end

