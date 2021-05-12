=begin

Problem
* find the sum of all multiples of a set of numbers up to a certain number
* the default set of multiples should be 3 and 5 if none are given

Examples
* 

Data Structure
* Numerics, Arrays

Algorithm(s)

1st method: (this one's faster)

ITERATE over set of base_numbers |num|
  LOOP
    break if num * iteration > limit
    multiples << num * iteration
    iteration += 1
return multiples.uniq.sum

2nd method:

SET range = (1..limit).to_a
SET multiples = []
ITERATE over set of base_numbers |num, i|
  multiples[i] = range.select { |n| n % num == 0 }
return multiples.flatten.uniq.sum

We'll see which is faster.

Code


class SumOfMultiples
  attr_reader :base_numbers

  DEFAULT_NUMBERS = [3, 5].freeze

  def initialize(*base_numbers)
    @base_numbers = base_numbers.empty? ? DEFAULT_NUMBERS : base_numbers
  end

  def to(limit)
    range = (1...limit).to_a
    multiples = []
    base_numbers.each_with_index do |base_number, i|
      multiples[i] = range.select { |n| (n % base_number).zero? }
    end
    multiples.flatten.uniq.sum
  end

  def self.to(limit)
    range = (1...limit).to_a
    multiples = []
    DEFAULT_NUMBERS.each_with_index do |base_number, i|
      multiples[i] = range.select { |n| (n % base_number).zero? }
    end
    multiples.flatten.uniq.sum
  end
end


# test = SumOfMultiples.new(1)
# p test.base_numbers

=end

class SumOfMultiples
  attr_reader :base_numbers

  DEFAULT_NUMBERS = [3, 5].freeze

  def initialize(*base_numbers)
    @base_numbers = base_numbers.empty? ? DEFAULT_NUMBERS : base_numbers
  end

  def to(limit)
    multiples = []
    base_numbers.each do |base_number|
      i = 0
      loop do
        break if base_number * i >= limit

        multiples << base_number * i
        i += 1
      end
    end
    multiples.uniq.sum
  end

  def self.to(limit)
    new.to(limit)
  end
end
