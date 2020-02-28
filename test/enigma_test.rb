require_relative 'test_helper'
require './lib/enigma'
require './lib/shift_generator'

class EnigmaTest < Minitest::Test
  def setup
    @shift_generator = ShiftGenerator
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    assert_instance_of ShiftGenerator, @enigma.shift_generator
  end

end
