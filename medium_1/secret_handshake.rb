class SecretHandshake
  OPERATIONS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(num)
    @binary = num.class == Integer ? num.to_s(2) : num 
    @binary = '0' if @binary =~ /[^01]+/
  end

  def commands 
    output = []
    @binary.reverse.each_char.with_index do |char, i|
      output << OPERATIONS[i] if char == '1' && i < 4
      output.reverse! if char == '1' && i >= 4
    end
    output
  end
end
