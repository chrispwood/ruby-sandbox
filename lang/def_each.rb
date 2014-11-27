#!/usr/bin/env ruby

class Thing
  def_each :try do |method_name, param|
    puts param
  end
end

Thing.new.try('hello world')
