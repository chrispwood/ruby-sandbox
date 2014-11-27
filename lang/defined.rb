#!/usr/bin/env ruby

class Foo
  attr_accessor :my_ivar

  def stuff_defined
    puts "my_ivar defined? #{instance_variable_defined?(:@my_ivar)}"
    @my_ivar = "happy"
    puts "my_ivar defined? #{instance_variable_defined?(:@my_ivar)}"

    puts "fake_ivar defined? #{instance_variable_defined?(:@fake_ivar)}"
  end
end

Foo.new.stuff_defined
