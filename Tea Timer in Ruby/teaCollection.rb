#!/usr/bin/env ruby
require "./Tea.rb"

class TeaCollection
	attr_accessor :container, :tea_obj, :fill_in_percent

	def initialize(container, tea_obj, fill_in_percent )
		@container = container
		@tea_obj = tea_obj
		@fill_in_percent = fill_in_percent
	end
end


def create_teas

	$teas_array = Array.new
	teas = %w(Pfefferminze Apfel Ingwer Sencha Zitrone-Grün Chai Schwarz Kamille).sort
	prio = 2
	type = "Beutel"
	teas.each do |t| 
		if t == "Schwarz" 
			prio = 1 
			type = "Lose"
		else
			prio = 2 
			type = "Beutel"
		end

		$teas_array.push(Tea.new(t, prio, type))
	end
end



create_teas()
t_col = TeaCollection.new("Bamboo Box by Oma", $teas_array, 40)

unsorted_array = Array.new
t_col.tea_obj.each {|t| unsorted_array.push t.get_tea}
puts unsorted_array.sort()

puts t_col.container 
puts "#{t_col.fill_in_percent}% Aufgefüllt" 
puts ""
t_col.tea_obj.each {|t| puts t.get_tea}
puts ""