=begin

Problem
* input is a string of words
* output is the same string of words with only one space between words and the odd words reversed

Examples
* "whats the matter with kansas." becomes "whats eht matter htiw kansas."
* "what's the matter with the state of kansas." becomes "what's eht matter htiw the etats of sasnak."

Data Structure
* 

Algorithm
Break string up by whitespace, iterate through array of words, reverse if i is odd, join with a space and output

Code

=end


def reverse_odd_words(str)
  words = str.split(/[ \.]+/).map.with_index do |word, i| 
    i.odd? ? word.reverse : word
  end
  words.join(' ') + '.'
end


=begin

Problem
* Same as above except you read and output each character one at a time

Examples
* 

Data Structure
* 

Algorithm
SET reverse = false
SET i = 0
ITERATE through string one character at a time
  if reverse == false
    if character is not a space
      print character and increase i
    else
      print space
      loop
        increase i
        set previous char
        set current char
        if previous_char == letter and current_char == space
          set end_of_word = i
          set reverse = true
          break
  else
    print character and decrease i
    set previous char 
    set current char
    if previous char == letter and current_char == space
      set i = end_of_word
      set reverse = false      

Code

=end


def reverse_odd_words_bonus(str)
  reverse = false
  output_str = ''
  output_i = 0

  str.each_char.with_index do |char, i|
    if char =~ /\w/ && !reverse
      output_str[output_i] = char
      output_i += 1
    elsif char =~ /\s/ && str[i + 1] =~ /\w/
      output_i = output_str.length
      output_str[output_i] = char
      output_i += 1
      reverse = !reverse
    elsif char =~ /\w/ && reverse
      output_str.insert(output_i, char)
    end
  end

  output_str + '.'
end

str = 'whats    the matter with kansas.'

p reverse_odd_words(str)
p reverse_odd_words_bonus(str)
