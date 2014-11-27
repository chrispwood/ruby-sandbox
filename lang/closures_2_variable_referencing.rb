class Foo
  def call_my_func(my_proc)
    my_proc.call
  end

  def setup
    a = 'a is great!'
    my_proc = Proc.new { puts a }
    a = 'a is awful'
    my_proc
  end
end

f = Foo.new()
f.call_my_func(f.setup)
