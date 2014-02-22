#!/usr/bin/env ruby

require 'date'

exit if `which pry`.empty?

last_update = DateTime.parse(File.stat(`brew --repository`.strip + '/.git').mtime.to_s)
days = (DateTime.now - last_update).to_i

if days >= 3
  puts
  puts "#{days} days have passed since last 'brew update'."
  puts "Run following commands to update homebrew:"
  puts "  $ brew update"
  puts "  $ brew upgrade"
  puts
end