require_relative '../lib/regex_factory'
# File created 6/9/2022 by Jake McCann
# Edited 6/11/2022 by Daniel Wu
# Edited 6/13/2022 by Daniel Wu
# Edited 6/14/2022 by Jake McCann
describe 'Regex_Factory' do
    # Created 6/11/2022 by Daniel Wu
    # Edited 6/18/2022 by Noah Moon
    it 'filter course by class number' do
      filterHash = Hash.new
      filterHash = {"num" => "1110"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /class=['|"]number['|"]>\(1110\)<\/span>.*?.*/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/12/2022 by Daniel Wu
    # Edited 6/18/2022 by Noah Moon
    it 'filter course by class title' do
      filterHash = Hash.new
      filterHash = {"title" => "Introduction to Computing"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /<h4 class=['|"]title['|"]>.*?Introduction to Computing.*?(?=<span class=['|"]number['|"]>).*?.*/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/12/2022 by Daniel Wu
    # Edited 6/18/2022 by Noah Moon
    it 'filter course by class description' do
      filterHash = Hash.new
      filterHash = {"descr" => "A course of general interest giving"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /class=['|"]label['|"]>Description.*?A course of general interest giving.*?(?=Prereq:).*?.*/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/12/2022 by Daniel Wu
    # Edited 6/18/2022 by Noah Moon
    it 'filter course by class prereqs' do
      filterHash = Hash.new
      filterHash = {"pre" => "1112"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected =/Prereq:.*?1112.*?<span class=['|"]label['|"]>.*?.*/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/12/2022 by Daniel Wu
    # Edited 6/18/2022 by Noah Moon
    it 'filter course by class hours' do
      filterHash = Hash.new
      filterHash = {"hrs" => "3"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /Units:<\/span> 3<\/p>.*?.*/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/13/2022 by Daniel Wu
    # Edited 6/18/2022 by Noah Moon
    it 'filter course by class number and class hours' do
      filterHash = Hash.new
      filterHash = {"num" => "1110", "hrs" => "3"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /class=['|"]number['|"]>\(1110\)<\/span>.*?Units:<\/span> 3<\/p>.*?.*/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/13/2022 by Daniel Wu
    # Edited 6/18/2022 by Noah Moon
    it 'filter course by class description and class number' do
      filterHash = Hash.new
      filterHash = {"descr" => "experience with personal computer", "num" => "1111"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /class=['|"]label['|"]>Description.*?experience with personal computer.*?(?=Prereq:).*?class=['|"]number['|"]>\(1111\)<\/span>.*?.*/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/13/2022 by Daniel Wu
    # Edited 6/18/2022 by Noah Moon
    it 'filter course by class title, class number, and class description' do
      filterHash = Hash.new
      filterHash = {"title" => "Computing Technology", "num" => "1110", "descr" => "Problem solving"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /<h4 class=['|"]title['|"]>.*?Computing Technology.*?(?=<span class=['|"]number['|"]>).*?class=['|"]number['|"]>\(1110\)<\/span>.*?class=['|"]label['|"]>Description.*?Problem solving.*?(?=Prereq:).*?.*/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/13/2022 by Daniel Wu
    # Edited 6/18/2022 by Noah Moon
    it 'filter course by class title, number, description, prereqs, and hours' do
      filterHash = Hash.new
      filterHash = {"title" => "Computer-Assisted Problem Solving", "num" => "1111", "descr" => "Problem solving", "pre" => "1113", "hrs" => 3}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /<h4 class=['|"]title['|"]>.*?Computer-Assisted Problem Solving.*?(?=<span class=['|"]number['|"]>).*?class=['|"]number['|"]>\(1111\)<\/span>.*?class=['|"]label['|"]>Description.*?Problem solving.*?(?=Prereq:).*?Prereq:.*?1113.*?<span class=['|"]label['|"]>.*?Units:<\/span> 3<\/p>.*?.*/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/14/2022 by Jake McCann
    it 'accepts valid output file name' do
      expect(Regex_Factory::FILE_REGEX.match?("h2_llo.html")).to be_truthy
    end

    # Created 6/14/2022 by Jake McCann
    it 'accepts valid output file path' do
      expect(Regex_Factory::FILE_REGEX.match?("/dog/bruh/h2_llo.html")).to be_truthy
    end

    # Created 6/14/2022 by Jake McCann
    it 'rejects filename with no .html' do
      expect(Regex_Factory::FILE_REGEX.match?("h2_llo")).to be_falsey
    end

    # Created 6/14/2022 by Jake McCann
    it 'rejects filename with wrong slashes in path' do
      expect(Regex_Factory::FILE_REGEX.match?("\\fds\\fds\\h2_llo.html")).to be_falsey
    end

    # Created 6/14/2022 by Jake McCann
    it 'rejects file name with illegal characters' do
      illegal_filenames = %w[# = - < > % & * ? { } / \ \   @ : " ' ! $ ` | ' "].map! { |char| "#{char}.html"}
      illegal_filenames.each { |filename|expect(Regex_Factory::FILE_REGEX.match?(filename)).to be_falsey }
    end

    # Created 6/14/2022 by Jake McCann
    it 'rejects file path with illegal characters' do
      illegal_filenames = %w[# = - < > % & * ? { } / \ \   @ : " ' ! $ ` | ' "].map! { |char| "#{char}/wrong.html"}
      illegal_filenames.each { |filename|expect(Regex_Factory::FILE_REGEX.match?(filename)).to be_falsey }
    end

    # Created 6/14/2022 by Jake McCann
    it 'accepts empty file name' do
      expect(Regex_Factory::FILE_REGEX.match?("\n")).to be_truthy
    end

    # Created 6/14/2022 by Jake McCann
    it 'accepts course number with four digits' do
      [1111,2222,3333,4444,5555,6666].each { |num| expect(Regex_Factory::COURSE_NUM_REGEX.match?(num.to_s)).to be_truthy }
    end


    # Created 6/14/2022 by Jake McCann
    it 'accepts empty course num' do
      expect(Regex_Factory::COURSE_NUM_REGEX.match?("\n")).to be_truthy
    end

    # Created 6/14/2022 by Jake McCann
    it 'accepts credit hours between 1 and 6 hours' do
      (1...6).each { |num| expect(Regex_Factory::COURSE_HOURS_REGEX.match?(num.to_s)).to be_truthy }
    end

    # Created 6/14/2022 by Jake McCann
    it 'denies credit hours above 6' do
      (7...10).each { |num| expect(Regex_Factory::COURSE_HOURS_REGEX.match?(num.to_s)).to be_falsey }
    end

    # Created 6/14/2022 by Jake McCann
    it 'denies credit hours with more than one digit' do
      [11,222,3333,4444,55555].each { |num| expect(Regex_Factory::COURSE_HOURS_REGEX.match?(num.to_s)).to be_falsey }
    end

    # Created 6/14/2022 by Jake McCann
    it 'accepts empty credit hour' do
      expect(Regex_Factory::COURSE_HOURS_REGEX.match?("\n")).to be_truthy
    end

    it 'filter section by section number' do
      filterHash = {"sec_num" => "0005"}
      result = Regex_Factory.convert_section_filter_to_regex filterHash
      expected = Regexp.new "\"classNumber\".*?\"section\":\"0005\".*?\"termCode\""
      expect(result.to_s == expected.to_s).to be_truthy
    end

    it 'filter section by mode' do
      filterHash = {"mode" => "In Person"}
      result = Regex_Factory.convert_section_filter_to_regex filterHash
      expected = Regexp.new "\"classNumber\".*?\"instructionMode\":\"In Person\",\"meetings\".*?\"termCode\""
      expect(result.to_s == expected.to_s).to be_truthy
    end

    it 'filter section by building' do
      filterHash = {"building" => "DREESE"}
      result = Regex_Factory.convert_section_filter_to_regex filterHash
      expected = Regexp.new "\"classNumber\".*?\"facilityDescription\":\"DREESE\".*?\"termCode\""
      expect(result.to_s == expected.to_s).to be_truthy
    end
    it 'filter section by all filters' do
      filterHash = {"sec_num" => "0005", "mode" => "In Person", "building" => "Dreese Laboratories", "room" => "357","start_time" => "8:00 am",
      "end_time" => "8:55 am", "term" => "Spring 2022", "city" => "Columbus"}
      result = Regex_Factory.convert_section_filter_to_regex filterHash
      expected = /"classNumber".*?"section":"0005".*?"instructionMode":"In Person","meetings".*?"facilityDescription":"Dreese Laboratories".*?"room":"357".*?"startTime":"8:00 am".*?"endTime":"8:55 am".*?"term":"Spring 2022".*?"campus":"Columbus".*?"termCode"/
      puts result.to_s
      expect(result.to_s == expected.to_s).to be_truthy
    end
end
