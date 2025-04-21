module StringCalculator
  def self.add(numbers)
    numbers_array = numbers.split(/[,\n]/)
    print("numbers_array: #{numbers_array}\n")
    numbers = numbers_array.map(&:to_i)
    numbers.sum
  end
end
