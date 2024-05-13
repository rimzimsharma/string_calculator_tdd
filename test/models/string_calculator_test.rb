# test/models/string_calculator_test.rb

require 'test_helper'
require 'string_calculator'

class StringCalculatorTest < ActiveSupport::TestCase
  def setup
    @calculator = StringCalculator.new
  end

  test "empty string returns 0" do
    assert_equal 0, StringCalculator.add("")
  end

  test "single number returns the number itself" do
    assert_equal 1, StringCalculator.add("1")
  end

  test "sum of comma-separated numbers" do
    assert_equal 6, StringCalculator.add("1,2,3")
  end

  test "sum of comma and newline separated numbers" do
    assert_equal 4, StringCalculator.add("1\n2,3")
  end

  test "sum with custom delimiter" do
    assert_equal 3, StringCalculator.add("//;\n1;2")
  end

  test "raises error for negative numbers" do
    assert_raises(ArgumentError) { StringCalculator.add("1,-2,3") }
  end

  # Add more test cases here
end