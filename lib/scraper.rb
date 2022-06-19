# Created 6/8/2022 by Jake McCann
# Edited 6/11/2022 by Jake McCann
# Edited 6/16/2022 by Yuhao Yan: parentheses removed
# Edited 6/17/2022 by Noah Moon
require 'nokogiri'

class Scraper
  # Created 6/8/2022 by Jake McCann
  # Edited 6/11/2022 by Jake McCann
  # filter_as_regex: regex representation of user filter parameters
  # html_to_scrape: html representation of page to be scraped

  def self.scrape_courses filter_as_regex, html_to_scrape
    #get sections of html_to_scrape that follow filter_as_regex
    filter_as_regex = /.*/ if filter_as_regex == nil
    array = scrape_all_courses html_to_scrape
    array.select { |course| course.to_s.match? filter_as_regex }
    #Once filtering is implemented, the array above can be searched through with filter_as_regex
  end

  # Created 6/17/2022 by Noah Moon
  # Edited 6/18/2022 by Noah Moon
  def self.scrape_sections(filter_as_regex, html_to_scrape)
    filter_as_regex = /.*/ if filter_as_regex == nil
   html_to_scrape.scan(/(?<={)"classNumber".*?"termCode"/).select{|section| section.to_s.match? filter_as_regex}
  end

  private
  # Created 6/11/2022 by Jake McCann
  # Breaks entirety of html_to_scrape down to array of html fragments containing course information
  # html_to_scrape: html string of entire courses webpage
  def self.scrape_all_courses html_to_scrape
    noko_html = Nokogiri::HTML html_to_scrape
    # grab html segments containing course information
    scraped_courses = noko_html.css('div[id]').select{ |div| div['id'] =~ /accordion-region-id-\d+/}
    clean_scraped_courses = Array.new scraped_courses.length, ""
    # grab child course information, removes whitespace between html tags
    scraped_courses.each_with_index {|course_div, idx| course_div.children.each {|child| clean_scraped_courses[idx] += child.to_s.gsub /\s*\n\s*/, ''}}
    clean_scraped_courses
  end
end