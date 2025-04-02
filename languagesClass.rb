#!/usr/bin/ruby

END {
	langsObj1 = Langs.new()
	langsObj1::output
	## Return
}

class Langs
	@@input = Array(0..12)
	@@input = "Java", "C#", "SQL", "TypeScript", "Python", "Ruby"
	@@iterating = 0
	@@iterArray = nil
	@@newLangs = Array.new() 
	#puts @@input

	def initialize
		@langs = @@input
		@langs = @langs.reverse
		
		
		#Swaping Elemen@ts By Id and by Search for index
		@langs[2], @langs[3] = @langs[3], @langs[2]
		@java = @langs.index("Java")
		@ts   = @langs.index("TypeScript")
		@langs[@java], @langs[@ts] = @langs[@ts], @langs[@java]
		
		## function call
		convert

	end



	def convert
		for each in @@input
			each = each.downcase
			each = each.upcase
			each = each.capitalize
			
			if each == ("Sql" || "sql" || "sql" ) then 
				each = each.upcase 
			end

			if each.include?("s" || "S") then
				letter = each["s"]
				each[letter] = letter.upcase
			end 
		 	@language   = each
		 	@@newLangs  << each
		 	@@iterating += 1
		end
		@@iterArray = Array(1..@@iterating)
	end
		
	def output
		counter = 0
		loop do
			printf "%-20s", @@newLangs[counter]
			printf "%s \n", @@iterArray[counter]
			counter += 1
			break if counter == @@newLangs.length
		end
	end

end

