#!/bin/ruby
#filename = `date +%H-%M-%S.png")`.to_s
dirname = `date +%H-%M-Screenshots`.strip
`mkdir #{dirname}`
`scrot './#{dirname}/%H-%M-%S.jpeg' -u -d 2`
(0..400).each do |x| `scrot './#{dirname}/#{x}-%H-%M-%S.jpeg' -u` end
