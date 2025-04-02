#!/bin/ruby

p abc_string = ("a" .. "m").to_a.select { |x| x =~ /[imke]/}
#p imke_String = [abc_string[1], abc_string[3], abc_string[2], abc_string[0]].join
#new_constructed_string = String.new

#p abc_string.pop

p new_constructed_string = [abc_string.delete_at(1), abc_string.delete_at(2), abc_string.delete_at(1), abc_string.delete_at(0)].join

##AWARE - After deleting one element - the Index shifts -1