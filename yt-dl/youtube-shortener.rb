#!/bin/ruby

link = ARGV[0] 
if link.include?("youtu.be") 
	puts link 
elsif link.include?("www")
	  link = link.gsub("www.","")
	  link = link.gsub("youtube.com", "youtu.be")
	  link = link.gsub("watch?v=", "")
	  puts link
end
 
#(link.include?("www") && not link.include?("youtube."))? p link.gsub("www.", "")

#case peferct: youtu.be
 
#case bad: www 

#case long: watch?v=