#!/usr/bin/ruby

require 'date'
require 'optparse'

options = ARGV.getopts('y:, m:')

option_year = options["y"].to_i
if options["y"] == nil
  year = Date.today.year
elsif option_year >= 1 && option_year <= 9999
  year = option_year
else
  puts "#{options["y"]} is out of range (1..9999)"
  return
end

option_month = options["m"].to_i
if options["m"] == nil
  month = Date.today.month
elsif option_month >= 1 && option_month <= 12
  month = option_month
else
  puts "#{options["m"]} is neither a month number (1..12) nor a name"
  return
end


puts "      " + month.to_s + "月 " + year.to_s
puts "日 月 火 水 木 金 土"


first_wday = Date.new(year, month, 1).wday
days = Date.new(year, month, -1).mday
dummy = Array.new(first_wday, "  ")
days_array = dummy + (1..9).map {|n| " " + n.to_s} + (10..days).map {|n| n.to_s}

6.times do |n|
  puts days_array.values_at(7 * n..7 * n + 6) * " "
end
