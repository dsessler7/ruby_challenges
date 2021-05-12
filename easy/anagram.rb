class Anagram
  attr_reader :anagram

  def initialize(anagram)
    @anagram = anagram
  end

  def match(words)
    words.select do |word|
      word.downcase.chars.sort == anagram.downcase.chars.sort && word.downcase != anagram.downcase
    end
  end
end
