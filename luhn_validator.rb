# frozen_string_literal: true

# module LuhnValidator
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    sum_digits = nums_a.reverse.map.with_index { |v, i| return_value(v, i) }
    sum = sum_digits.reduce { |n1, n2| n1 + n2 }
    (sum % 10).zero?
  end

  def return_value(value, index)
    return_value = if index.even?
                     value
                   elsif value * 2 <= 9
                     value * 2
                   else
                     value * 2 - 9
                   end
    return_value
  end
end
