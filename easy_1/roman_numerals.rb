=begin

# Initial version:

class Integer
  NUMERALS = %w(I V X L C D M - -).freeze

  def to_roman
    number = self
    
    output_str = ''
    4.times do |i|
      j = i * 2
      key = ["0", NUMERALS[j], NUMERALS[j]*2, NUMERALS[j]*3, NUMERALS[j]+NUMERALS[j+1], 
            NUMERALS[j+1], NUMERALS[j+1]+NUMERALS[j], NUMERALS[j+1]+NUMERALS[j]*2, 
            NUMERALS[j+1]+NUMERALS[j]*3, NUMERALS[j]+NUMERALS[j+2]]

      output_str.prepend(key[(number % (10**(i + 1))) / 10**i]) if key[(number % (10**(i + 1))) / 10**i] != '0'
      number -= number % (10**(i + 1))
    end

    output_str
  end
end

=end

# refactored:

class Integer
  NUMERALS = %w(I V X L C D M - -).freeze

  def to_roman
    self.digits.map.with_index do |num, i|
      j = i * 2
      key = ['', NUMERALS[j], NUMERALS[j]*2, NUMERALS[j]*3, NUMERALS[j] + NUMERALS[j + 1], 
            NUMERALS[j + 1], NUMERALS[j + 1] + NUMERALS[j], NUMERALS[j + 1] + NUMERALS[j]*2, 
            NUMERALS[j + 1] + NUMERALS[j]*3, NUMERALS[j] + NUMERALS[j + 2]]
      key[num]
    end.reverse.join
  end
end
