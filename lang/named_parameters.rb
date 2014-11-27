class Foo
  attr_accessor :var1, :var2, :var3
  def initialize(var1: 'var1', var2: 'var2', var3: 'var3')
    @var1, @var2, @var3 = var1,var2,var3
    puts "var1: #{@var1}, var2: #{@var2}, var3: #{@var3}"
  end
end

Foo.new
Foo.new(var1:'nice1',var2:'nice2',var3:'nice3')
Foo.new(var3:'reordered3',var1:'reordered2',var2:'reordered1')
Foo.new('none1','none2','none3')

