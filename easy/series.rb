# need to raise an argument error if slice method asks for more digits than the Series has

class Series
  attr_reader :digit_string

  def initialize(digit_string)
    @digit_string = digit_string
  end

  def slices(num)
    raise ArgumentError, "Slice number is larger than input length." if num > digit_string.length
    output_arr = []
    digit_string[0..-num].each_char.with_index do |_, i|
      temp_arr = []
      digit_string[i...(i + num)].each_char { |char| temp_arr << char.to_i }
      output_arr << temp_arr
    end
    output_arr
  end
end
