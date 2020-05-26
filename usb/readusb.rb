#!/usr/bin/ruby
require 'libusb'

#MxBit⅜
#libusb wrapper
#Thats the door
#To Hardware ->


print "ola\n"

search = "4-port"


rmID = "rm id"
readVendor =  "lsusb -v | grep idVendor | grep  idVendor > id"
appendProduct = "lsusb -v | grep idProduct | grep idProduct >> id"
returnID = "cat id"
returnCount = "wc -l id"

%x(#{rmID})
%x(#{readVendor})
%x(#{appendProduct})
count = %x(#{returnCount})
read  = %x(#{returnID})


idp = ""
idv = ""
idpFull = ""
idvFull = ""
vendor  = ""
product = ""

print read

counter = count.to_i / 2 

iterator = 0

read.each_line do |line|
	if line.include? "idProduct"; iterator+=1 end
	if line.include? search and line.include? "idProduct"
		start = line.index("0x")
		
		idpFull = line
		idp = idpFull[start..start+5]
		product = idpFull[start+7..] + "\n"
	end
end

according = 0

read.each_line do |line|
	if line.include? "idVendor"; according+=1 end
	if according == iterator 
		start = line.index("0x") and line.include? "idVendor"
		
		idvFull = line
		idv    = idvFull[start..start+5]
		vendor = idvFull[start+7..] + "\n"
	end
end


print "\n"+idp +" "+ product
print "\n"+idv +" "+ vendor

#print vendor
#print product 

#usb = LIBUSB::Context.new

#device = usb.devices(idVendor: idv, idProduct: idp).first


#device = open_interface(0) do |handle|
#	handle.control_transfer(bmRequestType: 0x40, bRequest: 0xa0, wIndex: 0x0000, dataOut: 1.chr)
#end