class Scrabble
  LETTER_VALUES = {
    'AEIOULNRST' => 1, 'DG' => 2, 'BCMP' => 3, 'FHVWY' => 4,
    'K' => 5, 'JX' => 8, 'QZ' => 10
  }

  def initialize(word)
    @word = word
  end

  def score
    self.class.score(@word)
  end

  def self.score(word)
    return 0 if word.nil? || word.empty?
    total = 0
    word.upcase.each_char do |char|
      LETTER_VALUES.each { |key, val| total += val if key.include?(char) }
    end
    total
  end
end
