#!/usr/bin/env ruby

my_str = "a great string"

lamb = ->(m) {m.length>0 ? "happy" : "sad"}

if my_str =~ /a great string(s?)/
  puts lamb.call($1)
end

if my_str =~ /a great strin(g?)/
  puts lamb.call($1)
end
