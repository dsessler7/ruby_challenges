=begin

class PigLatin
  def self.translate(str)
    str.split.map do |word|
      word.start_with?(/[aeiouy]/i) ? vowel_word(word) : consonant_word(word)
    end.join(' ')
  end

  private

  def self.vowel_word(word)
    if word.start_with?(/[y]/i) && word[1] =~ /[aeiou]/i
      consonant_word(word)
    else
      word + "ay"
    end
  end

  def self.consonant_word(word)
    if word.start_with?(/[x]/i) && word[1] =~ /[^aeiou]/i
      vowel_word(word)
    else
      i = slice_point(word)
      word[i..-1] + word[0...i] + "ay"
    end
  end

  def self.slice_point(word)
    word.each_char.with_index do |char, i|
      if char =~ /[aeiou]/
        if char == 'u' && word[i - 1] =~ /[q]/i 
          return i + 1 
        else
          return i
        end
      end
    end
  end
end
=end

# Using Regex:

class PigLatin
  def self.translate(str)
    str.split.map do |word|
      vowel_sound?(word) ? word + "ay" : consonant_word(word)
    end.join(' ')
  end

  def self.vowel_sound?(word)
    word =~ /\A([aeiou]|[xy][^aeiou]).*/
  end

  def self.consonant_word(word)
    word_parts = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
    word_parts[2] + word_parts[1] + "ay"
  end
end



=begin

# LS Solution:

class PigLatin
  def self.translate(phrase)
    phrase.split(' ').map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    if begins_with_vowel_sound?(word)
      word + 'ay'
    else
      consonant_sound, the_rest_of_word = parse_for_consonant(word)
      the_rest_of_word + consonant_sound + 'ay'
    end
  end

  def self.begins_with_vowel_sound?(word)
    word.match(/\A[aeiou]|[xy][^aeiou]/)
  end

  def self.parse_for_consonant(word)
    consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
    [consonant_split[1], consonant_split[2]]
  end
end
=end
