#!/usr/bin/ruby

class String
  alias_method :old_plus, :+

  def +( other)
    result = other.to_s
    result
  end
end

puts "hello" + " world"
puts "hello".old_plus " world"
# puts "hello" old_plus " world"
