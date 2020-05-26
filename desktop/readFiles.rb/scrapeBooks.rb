#!/usr/bin/ruby
require "/home/jack/.gem/ruby/2.7.0/gems/docsplit-0.7.6/lib/docsplit.rb"
require 'pdflib_wrapper'

booklist = Array.new
Dir.foreach('./books') do |file|
  next if file == '.' or file == '..'
  booklist.push file
  puts file
end


book0 = './books/' + booklist[0].to_s

##opening PDF
pdf = PdflibWrapper::Pdf.open_pdf(book0)
page = pdf.open_page(0)
puts page


#DOCSPLIT Attempt
#Docsplit.extract_text(book0, :output => 'book0', :pages => 1..3)
#txt1 = './book0/' + booklist[0].delete_suffix(".pdf")+ '_1.txt'
#page1 = File.open(txt1)
#page1.each  { |line| puts line }

puts book0


#bookfile = File.open("book.txt", "w")

#output.each do |line|
#  bookfile.write(line)
#end



#File.foreach('./books/' + booklist[0]) { |line| puts line }
#book1 = booklist[0].read
#puts book1