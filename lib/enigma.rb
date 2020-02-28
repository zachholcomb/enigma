class Enigma
  attr_reader :shift_generator

  def initialize
    @shift_generator = ShiftGenerator.new
  end
end
