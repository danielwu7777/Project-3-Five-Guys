# File created 6/9/2022 by Jake McCann
require_relative "../lib/deserializer"

#Runtime Testing Code:
sections = Array.new
section1 = Section.new "12345", "fall", "online", "Columbus", "Gym", "43212", "M TH F", "9:00 - 23:00", "PE 3901"
section2 = Section.new "23456", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section3 = Section.new "23456", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section4 = Section.new "23456", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section5 = Section.new "23456", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
sections.push section1, section2, section3, section4, section5

Deserializer.print_file sections,"../html_testing.html"

