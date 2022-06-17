# File created 6/9/2022 by Jake McCann
# File edited 6/10/2022 by Jake McCann
# File edited 6/16/2022 by Daniel Wu: Added tests for scrape_with_filter
require_relative '../lib/scraper'

describe 'Scraper' do
  # Created 6/10/2022 by Jake McCann
  # Edited 6/16/2022 by Daniel Wu: Added regex expression as first input to scrap_courses
  it 'returns array of all 4 desired content from courses_list_simple.html' do
    expected = Array.new 4, "<p>desired_content</p>"

    result = Scraper.scrape_courses(/.*/, IO.read("#{__dir__}/example_html/courses_list_simple.html"))

    expect(result == expected).to be_truthy
  end

  # Created 6/11/2022 by Jake McCann
  # Edited 6/16/2022 by Daniel Wu: Added regex expression as first input to scrap_courses
  it 'returns array with both courses information from courses_list_real.html' do
    expected = Array.new 2
    expected[0] = "<h4 class=\"title\"><span class=\"title\">Introduction to Computing Technology</span> "\
                  "<span class=\"number\">(1110)</span></h4><p class=\"description\"><span class=\"label\">"\
                  "Description:</span> A course of general interest giving experience with personal computer software,"\
                  " e.g., word processors and spreadsheets; provides fundamental computer literacy; neither teaches nor"\
                  " requires programming.<br>Prereq: Not open to students with credit for 1111 or 1113. "\
                  "<span class=\"label\">Units:</span> 3</p><p class=\"subject\"><span class=\"label\">Subject: "\
                  "</span>Computer Science and Engineering</p>"
    expected[1] = "<h4 class=\"title\"><span class=\"title\">Introduction to Computer-Assisted Problem Solving</span>"\
                  " <span class=\"number\">(1111)</span></h4><p class=\"description\"><span class=\"label\">"\
                  "Description:</span> Problem solving techniques using productivity software; spreadsheets, formulas,"\
                  " conditional logic; relational databases, relational algebra; word processing; data presentation;"\
                  " graphics.<br>Prereq: Not open to students with credit for 1112 (105), 1113 (101), or 200. GE quant"\
                  " reason math and logical anly course. <span class=\"label\">Units:</span> 3</p>"\
                  "<p class=\"subject\"><span class=\"label\">Subject: </span>Computer Science and Engineering</p>"

    result = Scraper.scrape_courses(/.*/, IO.read("#{__dir__}/example_html/courses_list_real.html"))

    expect(result == expected).to be_truthy
  end

  # Created 6/16/2022 by Daniel Wu
  it 'returns a filtered array with CSE 1110 from an array with all the courses' do
    expected = Array.new 1
    expected[0] = "<h4 class=\"title\"><span class=\"title\">Introduction to Computing Technology</span> "\
                  "<span class=\"number\">(1110)</span></h4><p class=\"description\"><span class=\"label\">"\
                  "Description:</span> A course of general interest giving experience with personal computer software,"\
                  " e.g., word processors and spreadsheets; provides fundamental computer literacy; neither teaches nor"\
                  " requires programming.<br>Prereq: Not open to students with credit for 1111 or 1113. "\
                  "<span class=\"label\">Units:</span> 3</p><p class=\"subject\"><span class=\"label\">Subject: "\
                  "</span>Computer Science and Engineering</p>"
    expected[1] = ""
    all_courses_in_array = Array.new 2
    all_courses_in_array = Scraper.scrape_all_courses(IO.read("#{__dir__}/example_html/courses_list_real.html"))
    filter_as_regex = /class=['|"]number['|"]>\(1110\).*class=['|"]label['|"]>.*Units:<\/span>.*3/
    result = Scraper.scrape_with_filter(filter_as_regex, all_courses_in_array)
    expect(result == expected).to be_truthy
  end

  # Created 6/16/2022 by Daniel Wu
  it 'returns a filtered array with CSE 1111 from an array with all the courses' do
    expected = Array.new 1
    expected[0] = ""
    expected[1] = "<h4 class=\"title\"><span class=\"title\">Introduction to Computer-Assisted Problem Solving</span>"\
                  " <span class=\"number\">(1111)</span></h4><p class=\"description\"><span class=\"label\">"\
                  "Description:</span> Problem solving techniques using productivity software; spreadsheets, formulas,"\
                  " conditional logic; relational databases, relational algebra; word processing; data presentation;"\
                  " graphics.<br>Prereq: Not open to students with credit for 1112 (105), 1113 (101), or 200. GE quant"\
                  " reason math and logical anly course. <span class=\"label\">Units:</span> 3</p>"\
                  "<p class=\"subject\"><span class=\"label\">Subject: </span>Computer Science and Engineering</p>"
    all_courses_in_array = Array.new 2
    all_courses_in_array = Scraper.scrape_all_courses(IO.read("#{__dir__}/example_html/courses_list_real.html"))
    filter_as_regex = /class=['|"]number['|"]>\(1111\).*class=['|"]label['|"]>Description.*using productivity software/
    result = Scraper.scrape_with_filter(filter_as_regex, all_courses_in_array)
    expect(result == expected).to be_truthy
  end

  # Created 6/16/2022 by Daniel Wu
  it 'returns a filtered array with CSE 1110 and CSE 1111 from an array with all the courses' do
    expected = Array.new 1
    expected[0] = "<h4 class=\"title\"><span class=\"title\">Introduction to Computing Technology</span> "\
                  "<span class=\"number\">(1110)</span></h4><p class=\"description\"><span class=\"label\">"\
                  "Description:</span> A course of general interest giving experience with personal computer software,"\
                  " e.g., word processors and spreadsheets; provides fundamental computer literacy; neither teaches nor"\
                  " requires programming.<br>Prereq: Not open to students with credit for 1111 or 1113. "\
                  "<span class=\"label\">Units:</span> 3</p><p class=\"subject\"><span class=\"label\">Subject: "\
                  "</span>Computer Science and Engineering</p>"
    expected[1] = "<h4 class=\"title\"><span class=\"title\">Introduction to Computer-Assisted Problem Solving</span>"\
                  " <span class=\"number\">(1111)</span></h4><p class=\"description\"><span class=\"label\">"\
                  "Description:</span> Problem solving techniques using productivity software; spreadsheets, formulas,"\
                  " conditional logic; relational databases, relational algebra; word processing; data presentation;"\
                  " graphics.<br>Prereq: Not open to students with credit for 1112 (105), 1113 (101), or 200. GE quant"\
                  " reason math and logical anly course. <span class=\"label\">Units:</span> 3</p>"\
                  "<p class=\"subject\"><span class=\"label\">Subject: </span>Computer Science and Engineering</p>"
    all_courses_in_array = Array.new 2
    all_courses_in_array = Scraper.scrape_all_courses(IO.read("#{__dir__}/example_html/courses_list_real.html"))
    filter_as_regex = /class=['|"]label['|"]>.*Units:<\/span>.*3/ 
    result = Scraper.scrape_with_filter(filter_as_regex, all_courses_in_array)
    expect(result == expected).to be_truthy
  end
end