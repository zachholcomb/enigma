require_relative 'shift_generator'

class Cipher
  attr_reader :shift_key
  
  def initialize
    @shift_key = ShiftGenerator.new
  end
end
