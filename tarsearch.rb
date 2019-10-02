#! /usr/bin/env ruby
# Dieses Skript uebernimmt einen Such-String und durchsucht alle DateiNAMEN in allen tgz danach
suchstring = ARGV
 
while suchstring.size < 1
	print "Bitte Such-String angeben: "
 	eingabe = gets.chomp
 	unless eingabe == ""
 		suchstring[0] = eingabe
 	end
 end
 puts %x[ pwd ]
 
 Dir.foreach('./') do |item|
   next unless item =~ /.tgz$/ or item =~ /tar.gz$/
   puts "========================================================\ndurchsuche #{item}:"
   cmd = "tar tzf #{item}"
   ergebnis = %x[ #{cmd}]
   ergebnis.each_line do |file|
   	suchstring.each do |s|
   		if file =~ /#{s}/
   			puts "#{file.chomp} gefunden."
   			print "Soll die Datei extrahiert werden? [j/N] : "
   			antwort = STDIN.gets
   			if antwort =~ /[jJyY]/
   				puts "OK, ich extrahiere #{file.chomp} aus #{item}."
           if File.exist?(file.chomp)
             ts = Time.now.to_i
   				  %x[/bin/tar --transform 's/$/#{ts}-/' -xzf #{item} #{file}]
           else
   				  %x[/bin/tar xzf #{item} #{file}]
           end
   			end
   		end
   	end
   end
 end
