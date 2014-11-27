#!/usr/bin/env ruby

mylam = lambda{ |x| x%2 == 0 }

result = mylam.call(2)
puts "yes" if result
result = mylam.call(1)
puts "no" if !result

def my_method(&block)
  if block.call
    puts "truthy"
  else
    puts "falsey"
  end
end

my_method do
  1 == 1
end

my_method do
  2 == 1
end
