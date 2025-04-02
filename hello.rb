#!/usr/bin/ruby -w


class PrintHello	
	def printIt
		for i in 1..@times
			puts "#{i}. Text: #{@text}"
		end
	end

	def initialize(number, text)
		@times = number
		@text = #text

	end

end

printer1 = PrintHello.new(4, "Raspberry's Pie")
printer1.printIt()

