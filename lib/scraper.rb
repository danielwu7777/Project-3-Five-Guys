# Created 6/8/2022 by Jake McCann
# Edited 6/11/2022 by Jake McCann
# Edited 6/16/2022 by Daniel Wu: Added scrape_with_filter
require 'nokogiri'

class Scraper
  # Created 6/8/2022 by Jake McCann
  # Edited 6/11/2022 by Jake McCann
  # Edited 6/16/2022 by Daniel Wu: Added filtering to all courses
  # filter_as_regex: regex representation of user filter parameters
  # html_to_scrape: html representation of page to be scraped
  def self.scrape_courses(filter_as_regex, html_to_scrape)
    #get sections of html_to_scrape that follow filter_as_regex
    all_courses_in_array = scrape_all_courses html_to_scrape
    filtered_courses_array = Scraper.scrape_with_filter(filter_as_regex, all_courses_in_array)
  end

  private
  # Created 6/11/2022 by Jake McCann
  # Breaks entirety of html_to_scrape down to array of html fragments containing course information
  # html_to_scrape: html string of entire courses webpage
  def self.scrape_all_courses(html_to_scrape)
    noko_html = Nokogiri::HTML html_to_scrape
    # grab html segments containing course information
    scraped_courses = noko_html.css('div[id]').select{ |div| div['id'] =~ /accordion-region-id-\d+/}
    clean_scraped_courses = Array.new scraped_courses.length, ""
    # grab child course information, removes whitespace between html tags
    scraped_courses.each_with_index {|course_div, idx| course_div.children.each {|child| clean_scraped_courses[idx] += child.to_s.gsub /\s*\n\s*/, ''}}
    clean_scraped_courses
  end

  private
  # Created 6/16/2022 by Daniel Wu
  # Returns an array of filtered courses 
  def self.scrape_with_filter(filter_as_regex, all_courses_in_array)
    filtered_courses_array = Array.new all_courses_in_array.length, ""
    # Iterate through all courses and add to filtered course array if the course is accepted by filter
    all_courses_in_array.each_with_index {|course, index| if (filter_as_regex =~ course) != nil then filtered_courses_array[index] += course end} # THERE'S A BUG HERE
    filtered_courses_array
  end
end