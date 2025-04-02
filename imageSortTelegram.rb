#!/bin/ruby

#require 'Dir::foreach'
#require 'Dir::each_child'

#Sorting Images in my Telegram Folder

@hash = {}
dir = "/home/max/Desktop/Telegram Images/"

Dir.foreach(dir) do |filename|
	next if filename == '.' or filename == '..' or filename == '.nomedia'
	
		#begin
		@hash.store(File.ctime(dir+filename), filename)
		#rescue Errno::ENOENT
		#	@hash.store(File.atime(dir+filename), filename)
		#else
		#	puts "Still Rigged"
		#end
end

@hash = @hash.sort.reverse

puts @hash
puts @hash.count

filenames = []


@hash.each do |key, value|
	filenames.push(value)
end

counter = 0;

Dir.glob(dir+'*') do |filename|
	next if filename == '.' or filename == '..' or filename == '.nomedia'
	File.rename(filename, dir+String(counter) +"_image.jpg")
	counter += 1
end
puts filenames

