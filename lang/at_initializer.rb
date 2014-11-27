#!/usr/bin/env ruby

class Foo
  attr_accessor :foo_var

  def initialize
    self.foo_var = "happy"
  end
end

puts Foo.new.foo_var
