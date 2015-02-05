# You can use the Benchmark module, also described in the library section on pp 773, to time sections of code.
# For example, we may wonder what the overhead of method invocation is. You can use Benchmark to find out:

require 'benchmark'
include Benchmark

LOOP_COUNT = 1_000_000

bmbm(12) do |test|
  test.report("inline:")    do
    LOOP_COUNT.times do |x|
      # nothing
    end
  end
  test.report("method:") do
    def method
      # nothing
    end
    LOOP_COUNT.times do |x|
      method
    end
  end
end

# You have to be careful when benchmarking, because oftentimes Ruby programs can run slowly because of the overhead of garbage collection.
# Because this garbage collection can happen any time during your program's execution, you may find that benchmarking gives misleading results, showing a section of code running slowly when in fact the slowdown was caused because garbage collection happened to trigger while that code was executing.
# The Benchmark module has the bmbm method that runs the tests twice, once as a rehearsal and once to measure performance, in an attempt to minimize the distortion introduced by garbage collection.
# The benchmarking process itself is relatively well-mannered -- it doesn't slow down your program much.
