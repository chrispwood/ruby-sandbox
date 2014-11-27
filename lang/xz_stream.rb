require 'xz'
require 'benchmark'

MEGABYTE = 1024 * 1024
KILOBYTE = 1024

time = Benchmark.measure do
CHUNK_SIZE = ARGV[1].to_i*KILOBYTE
File.open(ARGV[0], "rb") do |i_file|
  File.open(ARGV[1], "wb") do |o_file|
    while buf = i_file.read(CHUNK_SIZE) do
      o_file.write XZ.compress(buf)
    end
  end
end
end


puts time
