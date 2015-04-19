#!/usr/bin/env ruby

puts "Give me something now:"
str = gets
puts "the value I got is '#{str}'"

new_str = str.chomp
puts "chompd didn't change str '#{str}' but did create a new new_str: '#{new_str}'"
str.chomp!
puts "now str is correct '#{str}'"
