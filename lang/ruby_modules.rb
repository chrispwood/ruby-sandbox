#!/usr/bin/env ruby

module ScoringModule
  def score(var)
    var.length
  end
end


class Foo
  attr_accessor :my_foo_var

  def initialize
    @my_foo_var = 'foo var'
  end
end

class Bar < Foo
  include ScoringModule

  attr_accessor :my_bar_var

  def initialize
    @my_bar_var = 'bar var'
    super()
  end

  def score(input)
    500
  end

  # def score(input)
  #   input.length
  # end
end

class Thing
  include ScoringModule

  attr_accessor :not_like_foo

  def initialize
    @not_like_foo = 'definitely not foo'
  end

  # def score(input)
  #   input.length
  # end
end

b = Bar.new
# puts b.my_bar_var
# puts b.my_foo_var

t = Thing.new
# puts t.not_like_foo

puts "scoring"
puts b.score 'my score'
puts t.score 't score'




# BasicObject
# Object
# Foo
# <--- Anonymous_class(ScoringModule)
# Bar
# your_instance

# your_instance.score


module ScoringModule
  def score
    if @type.equal? 'container'
      container_score
    else
      tag_score
    end
  end

  def container_score
    score = 0
    @children.each do |child_score|
      score += child_score
    end
    score /= @children.length
  end

  def tag_score
    @tag_val
  end

  def self.included(base_klass)
    @method = "#{base_klass.to_s}_score"
  end
end

class Tag
  include ScoringModule

  attr_accessor :type
  attr_accessor :tag_val

  def initialize
    @type = 'tag'
    @tag_val = 50
  end
end

class Container
  include ScoringModule

  attr_accessor :type
  attr_accessor :children

  def initialize
    @type = 'container'
    @children = [50,60,70,80]
  end
end


t = Tag.new
c = Container.new

puts t.tag_score
puts c.container_score

element = t

# .......

puts element.score












