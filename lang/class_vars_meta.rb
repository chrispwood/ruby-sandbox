#!/usr/bin/env ruby

class Foo
  @@my_class_var = 'foo class'

  def self.my_class_var
    @@my_class_var
  end

  def self.my_meta_class_var
    @@my_meta_class_var
  end

  class << self
    @@my_meta_class_var = 'meta foo class'

    def blah
      @@my_meta_class_var
      @@my_class_var
    end
  end

  def self.meta
    class << self
      self
    end
  end
end

puts Foo.class_variables # @@my_class_var
puts Foo.meta.class_variables # @@my_meta_class_var
puts Foo.my_class_var # 'foo class'
puts Foo.my_meta_class_var # 'meta foo class'
puts Foo.blah # 'meta foo class' / 'foo class'
