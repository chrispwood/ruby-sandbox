require 'benchmark'
require 'prime'

include Benchmark

primes = 2_000_000
iterations = 20

num_threads = 4 
iterations_per_thread = iterations / num_threads

Prime.each(primes) {}

Benchmark.benchmark(CAPTION, 30, FORMAT, '>total:') do |x|
	st = x.report('single-threaded') do 
		iterations.times do
			Prime.each(primes) {}
		end
	end
	
	mt = x.report('multi-threaded') do
		num_threads.times.map do
			Thread.new do
				iterations_per_thread.times do
					Prime.each(primes) { }
				end
			end
		end.each(&:join)
	end

	[st+mt]
end