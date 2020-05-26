#!/usr/bin/env ruby
require 'joystick'

js0 = Joystick::Device.new('/dev/input/js0')
ev = js0.event("nonblocking")

puts js0.axes_maps.to_s + " Map Axes Value"
puts js0.buttons.to_s   + " Buttons"
puts js0.axes.to_s      + " Axes"

currentEvent = 0
while(true)

# eventValue = evH.value
# puts(eventTime.to_s + " " + eventType.to_s)
#
    ev = js0.event("nonblocking")
    if  ev && ev != currentEvent
      currentEvent = ev
      puts ev.number.to_s + " " + ev.value.to_s + " - " + js0.name.to_s
    end

end