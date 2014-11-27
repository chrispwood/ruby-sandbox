module Tmp
  module ClassMethods
    def my_load
      puts caller_path(caller)
      puts File.dirname(caller_path(caller))
      puts __FILE__
    end

    def caller_path(kaller)
      kaller[0].split(':')[0]
    end
  end

  def self.included(base_clazz)
    base_clazz.extend(ClassMethods)
  end
end
