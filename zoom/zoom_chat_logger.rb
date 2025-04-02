#/!usr/bin/ruby
require 'zoom_rb'

Zoom.configure do |c|
  c.api_key = 'xxx'
  c.api_secret = 'xxx'
end

zoom_client = Zoom.new