class StringCalculator
  def self.add(numbers)
    return 0 if numbers.blank?

    delimiter, numbers = extract_delimiter_and_numbers(numbers)
    integers = numbers.split(delimiter).map(&:to_i)

    negatives = integers.select { |num| num.negative? }
    if negatives.any?
      raise ArgumentError, "Negatives numbers are not allowed: #{negatives.join(', ')} "
    end

    integers.sum
  end

  private

  def self.extract_delimiter_and_numbers(numbers)
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..-1].split("\n", 2)
      [delimiter, numbers]
    else
      [",", numbers]
    end
  end
end