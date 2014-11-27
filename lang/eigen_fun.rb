class MyClass
  class << self
    GAMMA = 1.0
    def gamma; GAMMA; end
  end

  def gamma
    self.class.gamma
  end

  def my_method
    puts self.class.gamma
  end

end

puts MyClass.gamma
m = MyClass.new
puts m.gamma

