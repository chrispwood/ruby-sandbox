class Foo
  def foo1
  end

  def foo2
  end

  def my_methods
    self.class.instance_methods(false)
  end
end

puts Foo.new.my_methods
