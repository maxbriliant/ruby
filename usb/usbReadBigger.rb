#!/usr/bin/ruby
#Output for lsusb

$usbOut = `lsusb`.split(/\n+/)


class Reader
	def print_read
		puts "Connected Devices:"
		puts $usbOut
	end
end


ReadObj = Reader.new
ReadObj.print_read
puts Gem.user_dir
