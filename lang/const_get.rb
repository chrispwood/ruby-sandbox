#! /usr/bin/env ruby


module MyModule
  def module_method
    klass
  end

  def klass
    # klass_name = self.class.reflect_on_association(:metadata).class_name
    klass_name = self.class.name


    # puts "klass name: #{klass_name}"

    klass_name.split('::').inject(Object) do |mod, class_name|
      puts "mod: #{mod}, class_name: #{class_name}"
      mod.const_get(class_name)
    end
  end
end

module Foo
  module Bar
    class MyClass
      include MyModule
      def print
        puts "here I am in #{self.class.name}"
      end
    end
  end
end


m = Foo::Bar::MyClass.new
m.print

the_class = Object.const_get('Foo').const_get('Bar').const_get('MyClass')
the_class.new.print
m.module_method.new.print

# m.module_method.class
