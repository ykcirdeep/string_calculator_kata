# String Calculator Kata

This project implements the **String Calculator Kata**, a popular coding exercise designed to practice Test-Driven Development (TDD). The project includes a `StringCalculator` module that provides a method to sum numbers from a string input, with support for custom delimiters, handling of negative numbers, and ignoring numbers greater than 1000. Additionally, the project includes benchmarking to measure the performance of the `StringCalculator` with large inputs.

## Features

- **Basic Addition**: Adds numbers separated by commas or newlines.
- **Custom Delimiters**: Supports custom single-character or multi-character delimiters.
- **Negative Number Handling**: Raises an error when negative numbers are provided.
- **Large Number Handling**: Ignores numbers greater than 1000.
- **Whitespace Handling**: Ignores whitespace around numbers.
- **Performance Benchmarking**: Benchmarks the performance of the `StringCalculator` with inputs of varying sizes.

## Project Structure

```
string_calculator_kata/
├── benchmark/
│   └── string_calculator_benchmark.rb  # Benchmarking script for performance testing
├── lib/
│   └── string_calculator.rb            # Implementation of the StringCalculator module
├── spec/
│   ├── spec_helper.rb                  # RSpec configuration
│   └── string_calculator_spec.rb       # Unit tests for the StringCalculator module
├── Gemfile                             # Gem dependencies
└── .rspec                              # RSpec configuration file
```

### Details

- **`benchmark/string_calculator_benchmark.rb`**: Contains the benchmarking script to measure the performance of the `StringCalculator` with inputs of varying sizes (e.g., 1k, 100k, and 1M numbers).
- **`lib/string_calculator.rb`**: The core implementation of the `StringCalculator` module, which provides the `add` method to process and sum numbers from a string input.
- **`spec/string_calculator_spec.rb`**: Unit tests for the `StringCalculator` module, written using RSpec to ensure correctness and handle edge cases.
- **`spec/spec_helper.rb`**: Configuration file for RSpec, used to set up the testing environment.
- **`Gemfile`**: Lists the Ruby gem dependencies required for the project, such as RSpec for testing.
- **`.rspec`**: Configuration file for RSpec, specifying options for running tests.

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd string_calculator_kata
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

## Usage

### Running the String Calculator

The `StringCalculator` module is implemented in `lib/string_calculator.rb`. You can use the `add` method to calculate the sum of numbers in a string:

```ruby
require_relative 'lib/string_calculator'

result = StringCalculator.add("1,2,3")
puts result  # Output: 6
```

### Running Tests

The project uses RSpec for testing. To run the tests, execute:

```bash
bundle exec rspec
```

### Running Benchmarks

The benchmarking script is located in `benchmark/string_calculator_benchmark.rb`. To run the benchmarks, execute:

```bash
ruby benchmark/string_calculator_benchmark.rb
```

This will measure the performance of the `StringCalculator` with inputs of varying sizes (1k, 100k, and 1M numbers).

## Examples

Here are some examples of how the `StringCalculator.add` method works:

- **Empty String**: `StringCalculator.add("")` → `0`
- **Single Number**: `StringCalculator.add("5")` → `5`
- **Multiple Numbers**: `StringCalculator.add("1,2,3")` → `6`
- **Newline Delimiters**: `StringCalculator.add("1\n2,3")` → `6`
- **Custom Delimiters**: `StringCalculator.add("//;\n1;2")` → `3`
- **Negative Numbers**: `StringCalculator.add("-1,2,-3")` → Raises error: `"negative numbers not allowed: -1,-3"`
- **Numbers > 1000**: `StringCalculator.add("1001,2")` → `2`

## Development

### Adding Features

To add new features or modify the existing functionality, edit the `lib/string_calculator.rb` file. Ensure that you write corresponding tests in `spec/string_calculator_spec.rb`.

### Testing Extreme Inputs

The `spec/string_calculator_spec.rb` file includes tests for extreme inputs, such as handling 1 million numbers or maximum integer values.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
