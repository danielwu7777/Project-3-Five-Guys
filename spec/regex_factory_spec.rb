require_relative '../lib/regex_factory'
# File created 6/9/2022 by Jake McCann
# Edited 6/11/2022 by Daniel Wu
describe 'Regex_Factory' do
    # Created 6/11/2022 by Daniel Wu
    it 'filter course by class number' do
      filterHash = Hash.new
      filterHash = {"num" => "1110"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /class=['|"]number['|"]>\(1110\)/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/12/2022 by Daniel Wu
    it 'filter course by class title' do
      filterHash = Hash.new
      filterHash = {"title" => "Introduction to Computing"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /class=['|"]title['|"]>.*Introduction to Computing/

      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/12/2022 by Daniel Wu
    it 'filter course by class description' do
      filterHash = Hash.new
      filterHash = {"descr" => "A course of general interest giving"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /class=['|"]label['|"]>Description.*A course of general interest giving/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/12/2022 by Daniel Wu
    it 'filter course by class prereqs' do
      filterHash = Hash.new
      filterHash = {"pre" => "Not open to students with credit for 1112"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected =/Prereq:.*Not open to students with credit for 1112/
      expect(result.to_s == expected.to_s).to be_truthy
    end

    # Created 6/12/2022 by Daniel Wu
    it 'filter course by class hours' do
      filterHash = Hash.new
      filterHash = {"hrs" => "3"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = /class=['|"]label['|"]>.*Units:<\/span>.*3/ 
      expect(result.to_s == expected.to_s).to be_truthy
    end

=begin
    # Created 6/11/2022 by Daniel Wu
    it 'filter course by class number and class hours' do
      filterHash = Hash.new
      filterHash = {"num" => "1110", "hrs" => "3"}
      result = Regex_Factory.convert_course_filter_to_regex (filterHash)
      expected = #TODO
      expect(result.to_s == expected.to_s).to be_truthy
    end
=end
end