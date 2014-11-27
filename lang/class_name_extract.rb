#!/usr/bin/env ruby

module Foo
  module Bar
    class Baz
      def name
        self.class.name
      end
    end
  end
end

puts Foo::Bar::Baz.new().name
