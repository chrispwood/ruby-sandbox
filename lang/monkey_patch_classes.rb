class Foo
  def get_stuff
    'my_foo'
  end
end

class Bar < Foo
  def get_my_stuff
    'my stuff'
  end
end

class Bar
  def get_my_stuff
    'my monkeypatched stuff'
  end
end

puts Bar.new.get_my_stuff
puts Bar.new.get_stuff
