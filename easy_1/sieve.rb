=begin

Problem
* Use a special algorithm (Sieve of Eratosthenes) to find all primes from 2 up to given limit

Examples
* 

Data Structure
* Numerics, Arrays?

Algorithm
* Create a range starting at 2 and continuing up to and including the given limit
* Take the next available unmarked number in the list (it is prime)
* mark (or delete?) all multiples of that number (they are not prime)

SET numbers = (2..limit)
SET primes = []
SET composites = []
ITERATE over numbers
  primes << num if num is not in composites
  numbers.each do |multiplier| 
    break if num*multiplier > numbers.last
    composites << num*multiplier


Code

# Initial attempt:

class Sieve
  attr_reader :numbers, :primes, :composites

  def initialize(limit)
    @numbers = (2..limit)
    @primes = []
    @composites = []
    process_numbers
  end

  def process_numbers
    numbers.each do |number|
      next if composites.include?(number)

      primes << number
      numbers.each do |multiplier|
        break if number * multiplier > numbers.last

        composites << number * multiplier
      end
    end
  end
end

# tester = Sieve.new(10)
# p tester.primes

=end

# Realized that in this scenario, it is okay to mutate the collection of numbers
# you are iterating over since you will never be deleting numbers that have lower
# indices than the current index and so you'll never skip over any numbers that 
# you need to evaluate. So I made a refactored version with less code that is faster.

# Refactored version:

class Sieve
  def initialize(limit)
    @primes = (2..limit).to_a
  end

  def primes
    @primes.each do |prime|
      @primes.delete_if { |num| ((num % prime).zero? && num != prime) }
    end
    @primes
  end
end
