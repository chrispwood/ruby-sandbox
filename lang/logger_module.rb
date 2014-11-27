require 'logger'
require 'fileutils'

module MyLogger
  def self.logger
    @log ||= _initialize
  end

  def self._logger
  end

  def self.method_missing(method_name, *args, &block)
    puts "method missing is #{method_name}"
    logger.send(method_name, *args, &block) if logger.respond_to?(method_name)
    super
  end

  def self.respond_to?(method_name, include_all = true)
    logger.respond_to?(method_name) || super
  end


  class << self
    private 
    def _initialize
      FileUtils.mkpath(File.dirname('log/loggy/logger.log'))
      FileUtils.touch('log/loggy/logger.log')
      @log = Logger.new("log/loggy/logger.log")
      @log.progname = 'example'
      @log
    end
  end

end

puts MyLogger.respond_to?(:debug)
puts MyLogger.respond_to?(:debugs)
puts MyLogger.respond_to?(:logger)
puts MyLogger.respond_to?(:_logger)
#MyLogger._initialize
MyLogger.lbah
MyLogger.debug "debugging"
