=begin

Problem
* input is a string
* output is the corresponding protein for each codon in the input string
  * Each protein has specific codons
  * if the STOP codon is reached, translation ceases

Examples
* 

Data Structure
* strings, hash,

Algorithm
SET CONSTANT hash of all amino acids and codons

Split input string into array of 3 letter characters
iterate through this array
    iterate through constant hash and check for a match
      if there is a match, output protein to output string

Code

=end

class InvalidCodonError < StandardError; end

class Translation
  PROTEINS = {
    'Methionine' => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine' => %w(UUA UUG),
    'Serine' => %w(UCU UCC UCA UCG),
    'Tyrosine' => %w(UAU UAC),
    'Cysteine' => %w(UGU UGC),
    'Tryptophan' => %w(UGG),
    'STOP' => %w(UAA UAG UGA)
  }

  def self.of_codon(str)
    PROTEINS.each { |protein, codons| return protein if codons.any?(str) }
    raise InvalidCodonError
  end

  def self.of_rna(str)
    str.scan(/.../).map { |codon| of_codon(codon) }.slice_before('STOP').first
  end
end
