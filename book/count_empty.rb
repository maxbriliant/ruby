#!/usr/bin/ruby

training_text = "Entropy will raise AI into freedom".split("").map(&:downcase)
training_text_letter_count = training_text - [" "] # REMOVES EMPTY CHARACTERS in ARRAY

p training_text_letter_count