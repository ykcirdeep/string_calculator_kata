require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself when only one number is provided' do
      expect(StringCalculator.add("5")).to eq(5)
    end

    it 'returns the sum when two number is provided' do
      expect(StringCalculator.add("5, 9")).to eq(14)
    end

    it "given '1\n2,3' & it returns 6" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "given '//;\n1;2' & it returns 3" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "given '-1,2,-3' & it wil raise 'negative numbers not allowed: -1,-3'" do
      expect { StringCalculator.add("-1,2,-3") }.to raise_error("negative numbers not allowed: -1,-3")
    end

    it 'returns 6 for //[***]\n1***2***3' do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'raises an error with multiple negative numbers' do
      expect {
        StringCalculator.add("2,-4,3,-5")
      }.to raise_error("negative numbers not allowed: -4,-5")
    end
  
    it 'raises an error with negative numbers and custom delimiter' do
      expect {
        StringCalculator.add("//[***]\n1***-2***-7")
      }.to raise_error("negative numbers not allowed: -2,-7")
    end

    it "handles all numbers > 1000" do
      expect(StringCalculator.add("1001,2000")).to eq(0)
    end
  
    it "handles custom delimiters with large numbers" do
      expect(StringCalculator.add("//[;]\n1;1001;2;2000")).to eq(3)
    end
  
    it "handles newlines with large numbers" do
      expect(StringCalculator.add("1\n1001,2")).to eq(3)
    end
  
  end

  describe "with extreme inputs" do
    it "handles 10000 numbers" do
      input = "9," * 999999 + "9"
      expect(StringCalculator.add(input)).to eq(9000000)
    end

    it "handles maximum integer values" do
      max = 2**(0.size * 8 - 2) - 1
      expect(StringCalculator.add("#{max},#{max}")).to eq(0)
    end

    it "treats empty elements as zero" do
      expect(StringCalculator.add("1,,2")).to eq(3)
    end

    it "ignores whitespace around numbers" do
      expect(StringCalculator.add(" 1 , 2 ")).to eq(3)
    end
  end

  require 'benchmark'

  input = (1..1_000_000).to_a.join(',')
  time = Benchmark.realtime { StringCalculator.add(input) }
  puts "Processed 1M numbers in #{time.round(2)}s"
end
