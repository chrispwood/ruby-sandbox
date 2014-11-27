class Foo
  @@my_var = 'very sad'
  @my_var = 'sad'

  class << self
    attr_accessor :my_var
  end

  def self.get_class_instance_var
    @my_var
  end

  def self.get_class_var
    @@my_var
  end

  def get_class_var
    @@my_var
  end
end

class Bar < Foo
  @@my_var = 'very happy'
  @my_var = 'happy'
end

puts "Class instance var Foo is #{Foo.get_class_instance_var}"
puts "Class var Foo is #{Foo.get_class_var}"
puts "Class var Foo is #{Foo.new.get_class_var}"

puts "Class instance var Bar is #{Bar.get_class_instance_var}"
puts "Class var Bar is #{Bar.get_class_var}"
puts "Class var Bar is #{Bar.new.get_class_var}"
