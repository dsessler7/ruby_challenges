class BeerSong
  @@numbers = (0..99).map(&:to_s)
  @@numbers[0] = "no more"
  @@bottles = @@numbers.map { 's' }
  @@bottles[1] = ''
  @@take_down = @@numbers.map { 'Take one down and pass it around' }
  @@take_down[1] = 'Take it down and pass it around'
  @@take_down[0] = 'Go to the store and buy some more'

  def verse(num)
    "#{@@numbers[num].capitalize} bottle#{@@bottles[num]} of beer on the wall, " \
      "#{@@numbers[num]} bottle#{@@bottles[num]} of beer.\n" \
      "#{@@take_down[num]}, #{@@numbers[num - 1]} bottle#{@@bottles[num - 1]} of beer on the wall.\n"
  end

  def verses(first, last)
    output = ''
    first.downto(last) do |num|
      output << self.verse(num)
      output << "\n"
    end
    output.chomp
  end

  def lyrics
    self.verses(99, 0)
  end
end
