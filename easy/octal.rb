=begin

Problem
* convert an octal number to decimal

Examples
* 

Data Structure
* Strings, Numerics, Arrays?

Algorithm
return 0 if any characters other than 0-7
convert to integer and then back to string to get rid of leading zeros


Code

=end

class Octal
  attr_reader :octal

  def initialize(digit_str)
    @octal = digit_str.match(/[^0-7]/) ? 0 : digit_str.to_i
  end

  def to_decimal
    octal.digits.map.with_index { |digit, i| digit * (8**i) }.sum
  end
end
