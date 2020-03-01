require_relative 'test_helper'
require './lib/enigma'
require './lib/shift_generator'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
    # @enigma.shift_generator.stubs(:key).returns("02715")
    # @enigma.shift_generator.stubs(:date).returns("260220")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    expected = ["a", "b", "c", "d", "e", "f",
      "g", "h", "i", "j", "k", "l", "m", "n",
      "o", "p", "q", "r", "s", "t", "u", "v",
      "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.character_set
    assert_instance_of ShiftGenerator, @enigma.shift_generator
  end
  #
  # def test_it_has_shift_generator_default_values
  #   assert_equal "02715", @enigma.shift_generator.key
  #   assert_equal "260220", @enigma.shift_generator.date
  # end
  #
  # def test_it_can_encrypt_a_message_with_default_values
  #   assert_equal "keder ohulw", @enigma.encrypt("hello world")
  # end
end
