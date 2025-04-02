#!/bin/ruby
#jpgPixelExtracter
require 'oily_png'

image = "/home/max/Desktop/Old/Untitled2.png"

png = ChunkyPNG::Image.from_file(image)
palette = ChunkyPNG::Palette.from_canvas(png)

puts png.metadata
#puts palette.best_color_settings


$colorsHTML = ChunkyPNG::Color::PREDEFINED_COLORS
$looper = 0
$found = 0
$values = []

$colorsHTML.each do |key, value| 
	$values.push value.to_s#.scan(/(?<=<)(.*)(?=,)/)
end
#$values =  (?<=<)(.*)(?=,)

def nested(cc)
	cc = cc.to_i
	output = ($values.min_by {|x| (cc - x.to_i).abs})
	return output
end

#		puts "Yes & Color Code was exactly " + $looper.to_s + " Underneath."
#		$looper = 0
#		$found += 1
		

		#puts $values.min_by {|x| (n-x).abs}

#end
$colorsUnique = []
$colorsAll = []
palette.each do |colorCode|
	myCC = nested(colorCode) 
	$colorsUnique.push(myCC) unless $colorsUnique.include?(myCC)
	$colorsAll.push(myCC)
end 



####
#$colorsUnique.each do |i| 
#	pos = $colorsHTML.key(i.to_i)
#end
####


$colorNamesArrayAll = []

$colorsAll.each do |i|
	pos = $colorsHTML.key(i.to_i)
	$colorNamesArrayAll.push(pos)
	#puts $colorNamesArrayAll.count(pos.to_s).to_s + " " + pos 
end

puts $colorNamesArrayAll.uniq.map { |c| "#{$colorNamesArrayAll.count(c)} x #{c}"}.sort

#$colorsHTML.each do  |key, value| puts colorsHTML[key,i] end
#puts colorsHTML = ChunkyPNG::Color::PREDEFINED_COLORS
#puts $found
#puts $numbers
#puts palette
#$colorsHTML.each do  |key, value| puts value end


######### TODO
#GET PERCENTAGE OF COLOR BY OCCURENCE
#UNIQUE COLOR CODES REDOING 
#SORT FOR NUMBER IN PREFIX
#FILTER MEANINGFUL COLORS BY OCCURENCE