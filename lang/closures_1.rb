

class Foo
  def initialize
    @var = 100
  end
end

class Bar
  def method1(my_foo)
    myself = self
    my_foo.instance_eval do
      puts @var
      myself.method2
    end
  end

  def method2
    puts 'here i am'
  end
end

f = Foo.new
b = Bar.new

b.method1 f
