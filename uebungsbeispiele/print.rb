#!/usr/bin/env ruby

###
# Kommentar
###
system('clear')
dat = File.open("img.txt", "r")

dat.each do |l|
  puts l
  sleep 0.3
end

