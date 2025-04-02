#!/usr/bin/ruby

lines_read = Array.new

f1 =  File.open('ecosiaDic.txt')
input = File.readlines('ecosiaDic.txt') {x}
#File.write("cleaner.txt", input.uniq.to_s)
system("rm cleaner.txt; touch cleaner.txt")
 
input = input.map{ |x| x[/[^0-9]+/] } 
input = input.uniq 
File.open('cleaner.txt','a') {|f| f.puts input}
system('mv -f cleaner.txt ecosiaDic.txt')