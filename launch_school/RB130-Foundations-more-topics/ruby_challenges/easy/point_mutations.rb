class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  # def hamming_distance(new_strand)
  #   small, larger = [strand, new_strand].sort_by(&:size)
  #   distance = 0
  #   (0...small.size).each do |index|
  #     distance += 1 if small[index] != larger[index]
  #   end
  #   distance
  # end

  def hamming_distance(new_strand)
    small = [strand.size, new_strand.size].min
    distance = 0
    (0...small).each do |index|
      distance += 1 if strand[index] != new_strand[index]
    end
    distance
  end
end