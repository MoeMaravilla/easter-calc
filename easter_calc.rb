#!/usr/bin/ruby
################################################################################
# Copyright (C) 1998-2018 Moe Maravilla - All Rights Reserved
# You may use, distribute and modify this code under the terms of the MITs
# license.  You should have received a copy of the MIT license with this file.
################################################################################

##### This program calculates Easter for the given year.

##### Usage: easter_calc [<year>]

if ARGV.count == 1
  year = ARGV[0].to_i
elsif ARGV.count == 0
  year = Time.new.year

  print "Enter year [#{year}]>"

  temp = gets.strip

  if ( temp != '' )
    year = temp.to_i
  end
else
  print "Usage: #{$0} [<year>]"
  exit 1
end

if year < 100
  year += ( year < 60 )? 2000: 1900
end

a = year % 19
b = (year / 100).to_i
c = year % 100
d = (b / 4).to_i
e = b % 4
f = ((b + 8) / 25).to_i
g = ((b - f + 1) / 3).to_i
h = (19 * a + b - d - g + 15) % 30
i = (c / 4).to_i
k = c % 4
l = (32 + 2 * (e + i) - h -k) % 7
m = ((a + 11 * h + 22 * l) / 451).to_i
month = ((h + l - 7 * m + 114) / 31).to_i
day =   (h + l - 7 * m + 114) % 31 + 1

printf "\n%02d/%02d/%04d\n\n", month, day, year; 
