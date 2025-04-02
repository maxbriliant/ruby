#!/usr/bin/ruby
#encoding: utf-8

### TODO ADD DEPTH 3 TO FOLLOW UP LINKS
#require 'english'
require 'selenium-webdriver'
#require 'test-unit'
#require 'goto'

$treecount = 0;
deciduous_tree = "\u{1F333}"
evergreen_tree = "\u{1F332}"
evergreen_tree = evergreen_tree.encode('utf-8')
decituous_tree = evergreen_tree.encode('utf-8')


@my_options = Selenium::WebDriver::Chrome::Options.new(args: ['--disable-notifications','--disable-extensions', '--disable-gpu','--no-sandbox','--mute-audio', 'start-maximized'],"excludeSwitches" => ["enable-automation"])
@my_driver = Selenium::WebDriver.for(:chrome, capabilities: @my_options)

$f1 = File.open('ecosiaDic.txt', 'r')
$f2 = File.open('filler.txt', 'r')

$onEcosia = 1

##Adding Programming Words
#`cat clean_words.txt >> ecosiaDic.txt`
#`cat clean_dic.txt >> ecosiaDic.txt`
# ONE TIME

$i = 0

while true do

	$f3 = File.open('treecount.txt' , 'a')

	$i += 1 
	#puts "i = #{$i}"

	if($i % 6) == 0 then
		$fillerLink = File.readlines('filler.txt').sample
		p "Decay Link: "+$fillerLink.to_s
		@url = "#{$fillerLink.to_s.chomp}"
		@my_driver.get(@url)
		$onEcosia = 0
		sleep(6)
	end

	dict_lines_count = `wc -l 'ecosiaDic.txt'`.to_i
	
	def read_line_number(filename, number)
		found_line = nil
		File.foreach(filename) do |line|
			if $INPUT_LINE_NUMBER == number
  				found_line = line.chomp
  				break
			end
		end
		found_line
	end

	$randLine  = read_line_number('ecosiaDic.txt', rand(1..dict_lines_count))
	$randline2 = read_line_number('ecosiaDic.txt', rand(1..dict_lines_count))
	$randline3 = read_line_number('ecosiaDic.txt', rand(1..dict_lines_count))


#Beforely Used - sample (may not be random)
#File.readlines('ecosiaDic.txt').sample.chomp!

	$randTime = rand(50..77)
	$randCount = rand(2..3)

	case $randCount
	when 1
	  	p "Random Line: " +$randLine.to_s
	when 2
		$randLine += " "+$randline2.to_s
	  	p "Random Line: " +$randLine.to_s
	when 3
		$randLine += " "+$randline2.to_s+" "+$randline3.to_s
	  p "Random Line: " +$randLine.to_s
	end

	p "Random Waiting Time: " + $randTime.to_s

	puts ""
	p "Tree Growing!"

	@url = "https://www.ecosia.org/search?q=#{$randLine}"
	@my_driver.get(@url)
	$onEcosia = 1

	## Writing Treecount in File
	$current_treecount = File.read('treecount.txt').chomp.to_i
	$new_treecount = $current_treecount + 1
	puts $new_treecount.to_s+" Trees"+"\n\n"
	File.write('treecount.txt', $new_treecount)
	`notify-send "$(baum) New Trees Planted #{deciduous_tree}"` if $new_treecount%20==0
	$f3.close

	if $randCount == 2 then

		continue_links = Array.new
		rejector = "ecosia"
		acceptor = "images"

		##find element by tag 'a'
		#continue = @my_driver.find_elements(tag_name: 'a')
		elements = @my_driver.find_elements(xpath: "//a[@href]")
		elements.each {|elem| continue_links.push( elem.attribute("href") )}
		

		continue_links.delete_if { |d| d.include? rejector }

		sleep(7)

		## FOLLOW A RANDOM LINK - DEPTH 1
		link = continue_links.sample 
		@url = link
		#@my_driver.get(@url)

		## USE CLICK INSTEAD
		## Backpedal -> find xpath chosen by sample
		backpedal = link
		elements.each { |el| if el.attribute("href") == @url then backpedal = el end }
	    



		if backpedal != [] && $onEcosia == 1 then
			#@my_driver.find_element(class="result-title__heading").send_keys('webElement')
			#url = @my_driver.find_element(xpath: "//*[contains(text(), #{@url}]")
			#@my_driver.navigate.to(@url)
			#elment = @my_driver.find_element(by//a[@id="abc"][href="xyz"])
			#backpedal = @my_driver.switch_to.active_element
			#@my_driver.switch_to.active_element.send_keys 'qq'
			#backpedal.scroll_into_view
			
			if backpedal.displayed? then
				@my_driver.action.move_to(backpedal).click.perform
				$onEcosia = 0
			else
				puts 'NOT FOUND'
			end
			
		end

	

		#@my_driver.find_elements(xpath: "//a[@href=#{@url}]").click

		`echo #{continue_links} > linkfiles.cache`

	end

	sleep($randTime)

end