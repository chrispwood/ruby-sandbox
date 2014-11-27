require 'benchmark'

block_contract = Proc.new {|&blk|
  unless block_given?
    error = RuntimeError.new('Please define a block')
    error.set_backtrace(caller)
    raise error
  end
}

def my_method(error_contract,&block)
  error_contract.call(&block)
  Benchmark.measure('stuff', &block)
end

my_method(block_contract) { puts "hello world" }
#my_method
