#!/usr/bin/env ruby
require 'optparse'
require 'date'

options = ARGV.getopts('y:', 'm:')

input_year = options["y"]
input_month = options["m"]

# -yが入力されなかった場合は今年を指定
target_year = input_year.nil? ? Date.today.year : input_year.to_i
# -mが入力されなかった場合は今月を指定
target_month = input_month.nil? ? Date.today.month : input_month.to_i

# 対象月の初日
first_date_of_month = Date.new(target_year, target_month, 1)
# 対象月の最終日
last_date_of_month = Date.new(target_year, target_month, -1)

# 表示用の対象月('January' ~ 'December')
display_month = first_date_of_month.strftime('%B')
# 表示用の省略形の全曜日
display_days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'].join(' ')

# 全曜日に対する中央寄せで月、年を表示
puts "#{display_month} #{target_year}".center(display_days.size)
# 全曜日を表示
puts display_days

# 対象年月の全日を表示
(first_date_of_month..last_date_of_month).each do |date|
  if date.day == 1
    print date.day.to_s.rjust(2 + date.wday*3, ' ')
  else
    print date.day.to_s.rjust(2)
  end
  date.wday == 6 ? puts : print(' ')
  puts if date.day == last_date_of_month.day && date.wday != 6
end

puts

