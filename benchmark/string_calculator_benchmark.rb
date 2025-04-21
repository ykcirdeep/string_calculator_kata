require 'benchmark'
require_relative '../lib/string_calculator'

inputs = {
  "1k numbers" => (1..1_000).to_a.join(','),
  "100k numbers" => (1..100_000).to_a.join(','),
  "1M numbers" => (1..1_000_000).to_a.join(',')
}

Benchmark.bm do |x|
  inputs.each do |name, input|
    x.report(name) { StringCalculator.add(input) }
  end
end
