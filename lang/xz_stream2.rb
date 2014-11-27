require 'xz'
require 'benchmark'

time = Benchmark.measure do
  File.open('foo.txt','w') do |file|
    File.foreach(ARGV[0]).each do |line|
      file.write line
    end
  end
  XZ.compress_file 'foo.txt', 'foo.txt.xz'
end

puts time
