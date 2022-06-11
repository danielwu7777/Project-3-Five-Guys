require_relative '../lib/course'
# Created 6/9/2022 by Jake McCann
# Edited 6/10/2022 by Noah Moon
class Serializer
  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon : made class method, implemented method
  # courses_html: array of HTML sections where each element describes an entire course
  def self.serialize_courses(courses_html)
    # Convert courses_html into array of courses
    course_list = Array.new
    courses_html

    courses_html.each do |course_string|
      num = course_string.match(/(?<=<span class='number'>\().*?(?=\))/).to_s
      title = course_string.match(/(?<=<span class='title'>).*?(?=<)/).to_s #or <span class='title'>.*?<\/span>
      desc = course_string.match(/(?<=class='label'>Description:<\/span> )(.*?)(?=<br \/>)/ ).to_s
      prereqs = course_string.match(/(?<=<br \/>\n).*?(?= <)/ ).to_s
      hours = course_string.match(/(?<=Units:<\/span> ).*?(?=<)/).to_s
      course_list.unshift Course.new num, title, desc, prereqs, hours
    end
    course_list
  end

  # Created 6/9/2022 by Jake McCann
  # Edited 6/10/2022 by Noah Moon : made class method
  # sections_html: array of HTML sections where each element describes an entire section
  def self.serialize_sections(sections_html)
    # Convert sections_html into array of sections
  end
end