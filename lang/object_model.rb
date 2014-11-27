
class Object
  def eigenclass
    class << self
      self
    end
  end
end

class Foo
  @foo_eigen = 'foo_eigen_instance'

  def initialize
    @foo_instance = 'foo_instance'
  end

  def foo_method
    puts 'Foo#foo_method'
  end

  def self.eigen_foo
    puts 'Foo::Eigen#eigen_foo'
  end
end

class Bar < Foo

  @bar_eigen = 'bar_eigen_instance'
  
  def initialize
    @bar_instance = 'bar_instance'
  end

  def bar_method
    puts 'Bar#bar_method'
  end

  def self.eigen_bar
    puts 'Foo::Bar#eigen_bar'
  end
end

my_obj = Bar.new

def my_obj.define_method 
  puts 'my_obj instance method'
end

puts "obj eigen: my_obj.eigenclass -> #{my_obj.eigenclass}"
puts "obj eigen methods -> #{my_obj.eigenclass.methods(false)}\n\n"

puts "obj eigen superclass: Bar -> #{my_obj.eigenclass.superclass}"
puts "Bar methods -> #{my_obj.eigenclass.superclass.instance_methods(false)}\n\n"

puts "Bar eigen -> #{my_obj.eigenclass.superclass.eigenclass}"
puts "Bar eigen methods -> #{my_obj.eigenclass.superclass.class.methods(false)}"

puts "obj class: my_obj.class -> #{my_obj.class}"
puts "Bar class methods -> #{my_obj.class.methods(false)}\n"
puts "Bar eigenclass methods -> #{my_obj.class.methods(false)}"

puts "obj class: my_obj.eigenclass.superclass -> #{my_obj.class}"
puts "Bar eigen: #{Bar.instance_methods(false)}"


