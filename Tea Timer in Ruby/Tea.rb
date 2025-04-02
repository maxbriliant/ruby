#!/usr/bin/env ruby

class Tea
	attr_accessor :t_name, :priority, :type

	def initialize(t_name, priority=2, type="Beutel")
		if priority == 1
			@priority = 1
		elsif priority >= 2
			@priority = 2
		else
			p "#{priority} is no accpeted Value, use a Number\n For convenience Priority for #{t_name} is set to: 2"
		end
		@t_name = t_name
		@type = type
	end
	
	def get_tea
		return "Tee: #{@t_name}, #{@type}, Favorit: #{@priority}"
	end
end
