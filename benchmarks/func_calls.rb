require 'benchmark'

def create_array(index)
  [index, index+1, index+2]
end

n = 1000000
Benchmark.bm do |bm|
  bm.report("func_call") { records=[]; 1.upto(n) { |i| records << create_array(i) } }
  bm.report("no_func_call") { records=[]; 1.upto(n) { |i| records << [i, i+1, i+2] } }
end
