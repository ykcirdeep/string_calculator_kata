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
  end

  describe "with extreme inputs" do
    it "handles 10000 numbers" do
      input = "9," * 999999 + "9"
      expect(StringCalculator.add(input)).to eq(9000000)
    end

    it "handles maximum integer values" do
      max = 2**(0.size * 8 - 2) - 1 
      expect(StringCalculator.add("#{max},#{max}")).to eq(max * 2)
    end

    it "treats empty elements as zero" do
      expect(StringCalculator.add("1,,2")).to eq(3)
    end

    it "ignores whitespace around numbers" do
      expect(StringCalculator.add(" 1 , 2 ")).to eq(3)
    end
  end
end
