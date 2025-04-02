#!/usr/bin/ruby

require 'selenium-webdriver'
require 'test-unit'


@my_driver = Selenium::WebDriver.for :chrome

$f1 = File.open('ecosiaDic.txt', 'r')
$f2 = File.open('filler.txt', 'r')

$i = 0

while true do

	$i += 1 
	#puts "i = #{$i}"

	if($i % 6) == 0
		$fillerLink = File.readlines('filler.txt').sample
		p "Decay Link: "+$fillerLink.to_s
		@url = "#{$fillerLink}"
		@my_driver.get(@url)
		sleep(6)
	end



	$randLine = File.readlines('ecosiaDic.txt').sample.chomp!
	$randTime = rand(15..48)
	p "Random Line: " +$randLine.to_s
	p "Random Waiting Time: " + $randTime.to_s 

	puts ""
	p "Trees Growing!"
	puts ""

	@url = "https://www.ecosia.org/search?q=#{$randLine}"
	@my_driver.get(@url)

	sleep($randTime)


end