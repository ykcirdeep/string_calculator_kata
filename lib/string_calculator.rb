module StringCalculator
  def self.add(numbers)
    return 0 if numbers.to_s.empty?

    delimiter, nums = parse_delimiter(numbers)
    numbers = nums.split(/#{delimiter}/)
    negatives = numbers.select { |num| num.to_i < 0 }
    raise "negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    numbers.sum do |num|
      n = num.to_i
      raise "negative numbers not allowed: #{n}" if n < 0
      n <= 1000 ? n : 0
    end
  end

  private

  def self.parse_delimiter(input)
    if input.start_with?('//')
      delimiter, nums = input.split("\n", 2)
      delimiter = delimiter.start_with?('//[') ? Regexp.escape(delimiter[3...-1]) : Regexp.escape(delimiter[2..])
      [delimiter, nums]
    else
      [/[,\n]/, input]
    end
  end
end
