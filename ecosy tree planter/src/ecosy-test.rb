#!/usr/bin/ruby


### TODO FOLLOW SOME RANDOM LINKS ON PAGE


require 'selenium-webdriver'
require 'test-unit'

@my_driver = Selenium::WebDriver.for :chrome



	$randTime = rand(4..11)
	$randCount = rand(1..3)

	@url = "https://www.ecosia.org/search?q=thinkpad"
	@my_driver.get(@url)

	continue_links = Array.new

	##find element by tag 'a'
	#continue = @my_driver.find_elements(tag_name: 'a')
	elements = @my_driver.find_elements(xpath: "//a[@href]")
	elements.each {|elem| continue_links.push( elem.attribute("href") )}


	sleep($randTime)

	p link = "THE LINK: " + continue_links.sample

	@url = "https://www.ecosia.org/search?q="



