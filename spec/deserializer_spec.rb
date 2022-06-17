# File created 6/9/2022 by Jake McCann
# Edited 6/15/2022 by Yuhao Yan: Add more cases
require_relative "../lib/deserializer"

#Runtime Testing Code:
sections = Array.new
section1 = Section.new "12345", "fall", "online", "Columbus", "Gym", "43212", "M TH F", "9:00 - 23:00", "PE 3901"
section2 = Section.new "23456", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section3 = Section.new "10000", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section4 = Section.new "10001", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section5 = Section.new "10002", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section6 = Section.new "10003", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section7 = Section.new "10004", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section8 = Section.new "10005", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
section9 = Section.new "10006", "summer", "face-to-face", "Columbus", "Kroger", "AISLE 4 ", "M T W F", "8:30 - 23:50"
sections.push section1, section2, section3, section4, section5, section6, section7, section8, section9

Deserializer.print_file sections,"./html_testing.html"

