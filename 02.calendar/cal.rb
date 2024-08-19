#!/usr/bin/env ruby
require 'optparse'
require 'date'

options = ARGV.getopts('y:', 'm:')

input_year = options["y"]
input_month = options["m"]

target_year = input_year.nil? ? Date.today.year : input_year.to_i
target_month = input_month.nil? ? Date.today.month : input_month.to_i

first_date = Date.new(target_year, target_month, 1)
last_date = Date.new(target_year, target_month, -1)

display_month = first_date.strftime('%B')
display_days = 'Su Mo Tu We Th Fr Sa'

puts "#{display_month} #{target_year}".center(display_days.size)
puts display_days

(first_date..last_date).each do |date|
  if date.day == 1
    print date.day.to_s.rjust(2 + date.wday*3, ' ')
  else
    print date.day.to_s.rjust(2)
  end
  date.wday == 6 ? puts : print(' ')
  puts if date.day == last_date.day && date.wday != 6
end

puts

