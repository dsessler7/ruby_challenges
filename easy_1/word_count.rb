class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    output_hsh = Hash.new(0)
    @phrase.downcase.split(/[^a-z0-9']+/).each do |word|
      word[0] == "'" && word[-1] == "'" ? output_hsh[word[1...-1]] += 1 : output_hsh[word] += 1
    end
    output_hsh
  end
end
