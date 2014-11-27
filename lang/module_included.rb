module Foo
  module ClassMethods
    def get_things
      'things'
    end
    def get_self
      self.name
    end
  end

  def self.included(klass)
    puts "klass is #{klass}"
    klass.extend(ClassMethods)
  end
end

module Bar

  module ClassMethods
    def do_stuff
      puts "stuff being done with #{get_things} on class #{get_self}"
    end
  end

  def self.included(base_klass)
    puts "klass is #{base_klass}"
    base_klass.include(Foo)
    base_klass.extend(ClassMethods)
  end
end

class Thing
  include Bar
end

Thing.do_stuff
