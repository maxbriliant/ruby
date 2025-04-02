#!/bin/ruby

fh1 = File.open("/home/max/Karteikarten/Fresenius.txt", "r")

input = String.new()
fh1.each { | elem | input += elem }
puts input.gsub("<br>", "\n")
