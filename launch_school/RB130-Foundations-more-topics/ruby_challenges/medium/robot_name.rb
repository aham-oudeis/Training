class Robot
  attr_reader :name
  @@all_names = []

  def initialize
    @name = random_name
    @@all_names += [@name]
  end

  def random_name
    random_string = ''

    loop do
      2.times { random_string << ('A'..'Z').to_a.sample.to_s}
      3.times { random_string << rand(0..9).to_s }
      break unless @@all_names.include?(random_string)

      random_string = ''
    end

    random_string
  end

  def reset
    @name = random_name
  end
end