#!/bin/ruby

## HASHES

$einnahmen = 979
$laufende_ausgaben = {
#key :
#value =>
						amazon: 8,
						miete: 520,
						strom: 53,
						handy: 10,
						internet: 30,
						ticket: 63,
						konto: 14
					}

def sum_costs
	total = 0
	$laufende_ausgaben.each {|x, y| total += y}
	total
end

def printEntryText
	puts "Einnahmen = #{$einnahmen}"
	puts "Laufende Kosten = #{sum_costs}"
	puts "Monatlich zur Verfügung = #{$einnahmen-sum_costs}\n\n"
end

def printPosten
	$laufende_ausgaben.each {|x,y| puts "#{x}\n"}
	puts
end

def frageNachAusgabe 

	puts "Welche Ausgabe möchtest du hier erfragen: \n "

	printPosten()

	input = gets
	input = input.chomp.downcase.strip.to_s
	p $laufende_ausgaben[:"#{input}"]
	puts
end


def neuer_posten

	puts "\nName des neuen Postens: "
	
	input = gets
	name = input.chomp.downcase.strip.to_s
	puts

	puts "\nSumme des neuen Postens: "
	
	input_2 = gets
	summe = input_2.chomp.downcase.strip.to_s

	
	$laufende_ausgaben[:"#{name}"] = summe
	p "#{name} => #{summe} den Ausgaben hinzugefügen?"
	p "(ENTER zur Bestätigung    CTL-C zum Abbruch)"
	
	input = gets 
	if input == "\n"
		printPosten()
	    else p "Abgebrochen"
	end

end



printEntryText()
frageNachAusgabe()
neuer_posten()

p $laufende_ausgaben

#TODO: SCHREIBE EIN MENU ZUM HINZUFÜGEN NEUER POSTEN