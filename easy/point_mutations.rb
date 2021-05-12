class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    count = 0
    strand.each_char.with_index do |char, i|
      break if i == strand.length || i == other_strand.length
      count += 1 if char != other_strand[i]
    end
    count
  end
end
