#!/usr/bin/ruby

guess = ""

guessing_text_visual = "The Python Book"
guessing_text = guessing_text_visual.downcase

hidden_text = guessing_text.gsub(/[a-zA-Z]/, "_")

letters_w_spaces = guessing_text.split("")

#def numeric?(lookAhead)
#  lookAhead =~ /[0-9]/
#end

def is_letter(lookAhead)
  lookAhead =~ /[A-Za-z]/
end

def guessing
	guess = gets
	guess.is_letter ? guess : "This is no Letter, try again!\n"
	guessing
end

## STARTING LOOP
guessing
