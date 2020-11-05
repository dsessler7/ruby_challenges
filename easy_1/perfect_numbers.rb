=begin

Problem
* input is a number
* output is a classification of deficient, perfect, or abundant


Examples
* 

Data Structure
* numerics, arrays?

Algorithm
Need to find factors, then add them up
Factors method:
Iterate through a range of 2..(number/2)
  add divisor and division result if remainder equals zero
  uniq on results and sum them up

Code

=end

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 0
    sum = (2..(number/2)).select { |divisor| number % divisor == 0 }.reduce(1, :+)
    if sum < number then 'deficient'
    elsif sum == number then 'perfect'
    else 'abundant'
    end
  end
end
