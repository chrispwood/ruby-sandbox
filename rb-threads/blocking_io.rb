require 'benchmark'
require 'open-uri'

include Benchmark

url = 'http://online.wsj.com/home-page'
iterations = 100
num_threads = 10
iterations_per_thread = iterations / num_threads

Benchmark.bm(5) do |x|
	x.report('st') do
		iterations.times do
			open(url)
		end
	end

	x.report('mt') do
		num_threads.times.map do
			Thread.new do
				iterations_per_thread.times do
					open(url)
				end
			end
		end.each(&:join)
	end
end
