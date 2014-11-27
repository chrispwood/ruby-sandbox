
module PathLoader

  def self.included(klass)
    my_klass = klass
    define_method("#{klass.to_s.downcase}_path") do |identifier, mask|
      puts "example: #{klass.to_s.downcase}"
      "#{self.class.name} => identifier: #{identifier}, mask: #{mask}"
    end

    # klass.define_method("#{self.class.name.underscore}_path") do |identifier, mask|
    #   "#{self.class.name} => identifier: #{identifier}, mask: #{mask}"
    # end
  end
end

class Foo
  include PathLoader

  def my_method
    send("#{self.class.to_s.underscore}_path", self.start_ip_as_string, self.mask.to_s)
  end
end

f = Foo.new
puts f.foo_path('id1','my_mask')
