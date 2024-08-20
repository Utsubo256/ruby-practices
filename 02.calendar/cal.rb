#!/usr/bin/env ruby
require 'optparse'
require 'date'

options = ARGV.getopts('y:', 'm:')

year = options["y"] ? options["y"].to_i : Date.today.year
month = options["m"] ? options["m"].to_i : Date.today.month

first_date = Date.new(year, month, 1)
last_date = Date.new(year, month, -1)

target_month = first_date.strftime('%B')
days = 'Su Mo Tu We Th Fr Sa'

puts "#{target_month} #{year}".center(days.size)
puts days

print '   ' * first_date.wday
(first_date..last_date).each do |date|
  print date.day.to_s.rjust(2)
  date.saturday? ? puts : print(' ')
  puts if date == last_date && !date.saturday?
end

puts
