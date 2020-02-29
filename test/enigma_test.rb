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

  # def test_it_has_attributes
  #   expected = ["a", "b", "c", "d", "e", "f",
  #     "g", "h", "i", "j", "k", "l", "m", "n",
  #     "o", "p", "q", "r", "s", "t", "u", "v",
  #     "w", "x", "y", "z", " "]
  #   assert_equal expected, @enigma.character_set
  #   assert_instance_of ShiftGenerator, @enigma.shift_generator
  # end
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

# def test_it_can_split_return_value_of_generate_random_key_into_separate_keys
#   expected = { :key_A => 02, :key_B => 27, :key_C => 71, :key_D => 15}
#   assert_equal expected, @shift_generator.separate_random_key("02715")
#
#   random_test_key = @shift_generator.generate_random_key
#   assert_instance_of Hash, @shift_generator.separate_random_key(random_test_key)
#   assert_equal 4, @shift_generator.separate_random_key(random_test_key).values.length
# end
#
# def test_it_can_square_date_parameter
#   test_date = "270220"
#   assert_equal "73018848400", @shift_generator.square_date(test_date)
# end
#
# def test_it_can_get_last_4_digits_from_sqaure_date
#   squared_date_param = "73018848400"
#   assert_equal "8400", @shift_generator.last_four_digits(squared_date_param)
# end
#
# def test_it_can_separate_last_4_digits_from_square_dates_into_keys
#   four_digits = "8400"
#   expected = {key_A: 8, key_B: 4, key_C: 0, key_D: 0}
#   assert_equal expected, @shift_generator.separate_last_4_digits(four_digits)
# end
#
# def test_it_can_get_final_shift_values
#   expected = {key_A: 10, key_B: 31, key_C: 71, key_D: 15}
#   assert_equal expected, @shift_generator.final_shift_values("02715", "8400")
# end
