#!/usr/bin/env ruby

class Foo
  @@class_attr='haha'
  def self.class_attr
    @@class_attr
  end

  @class_instance_attr='foo'
  class << self
    attr_accessor :class_instance_attr
  end

  attr_accessor :instance_attr
  def initialize
    @instance_attr = 'bar'
  end
end

puts Foo.new.instance_attr
puts Foo.class_instance_attr
puts Foo.class_attr
