class Foo
def my_method(my_proc)
  @b = 'happy'
  my_proc.call
  end
end

class Bar
  def other_method
  @a = 'sad'
  local_var= 'what'
  my_scope = self

  Proc.new {
    puts @b
    puts local_var
  }
  end
end

b = Bar.new
f = Foo.new

f.my_method(b.other_method)
