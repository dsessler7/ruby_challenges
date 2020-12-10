=begin

Problem
* 

Examples
* 

Data Structure
* 

Algorithm
* 

Code

=end

class Luhn
  attr_reader :number, :addends, :checksum

  def initialize(num)
    @number = num
    @addends = num.digits.map.with_index do |digit, i|
      if i.odd?
        digit * 2 > 9 ? digit * 2 - 9 : digit * 2
      else
        digit
      end
    end.reverse
    @checksum = addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    temp_luhn = self.new(num*10)
    temp_luhn.number + ((10 - (temp_luhn.checksum % 10)) % 10)
  end
end
