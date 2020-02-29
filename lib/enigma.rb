class Enigma
  attr_reader :shift_generator, :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end
end
