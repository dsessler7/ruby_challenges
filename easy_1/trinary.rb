class Trinary
  attr_reader :trinary

  def initialize(digit_str)
    @trinary = digit_str.match(/[^0-2]/) ? 0 : digit_str.to_i
  end

  def to_decimal
    trinary.digits.map.with_index { |digit, i| digit * (3**i) }.sum
  end
end
