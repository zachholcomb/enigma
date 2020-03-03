require_relative 'test_helper'
require './lib/shift_generator'

class ShiftGeneratorTest < Minitest::Test
  def setup
    Date.stubs(:today).returns(Date.new(2020, 02, 26))
    @shift_generator = ShiftGenerator.new
  end

  def test_it_exists
    assert_instance_of ShiftGenerator, @shift_generator
  end

  def test_it_has_attributes
    assert_instance_of KeyGen, @shift_generator.key_gen
    assert_instance_of OffsetGen, @shift_generator.offset_gen
  end

  def test_it_can_split_return_value_of_generate_random_key_into_separate_keys
    expected =  [02, 27, 71, 15]
    assert_equal expected, @shift_generator.key_gen.create_key("02715")
  end

  def test_it_can_verify_key
    assert_equal true, @shift_generator.key_gen.verify_key("02715")
    assert_equal false, @shift_generator.key_gen.verify_key("999999")
    assert_equal false, @shift_generator.key_gen.verify_key("4444")
  end

  def test_it_can_square_date_parameter
    test_date = "270220"
    assert_equal "73018848400", @shift_generator.offset_gen.square_date(test_date)
  end

  def test_it_can_get_last_4_digits_from_sqaure_date
    squared_date_param = "73018848400"
    assert_equal "8400", @shift_generator.offset_gen.last_four_digits(squared_date_param)
  end

  def test_it_can_separate_last_4_digits_from_square_dates_into_keys
    four_digits = "8400"
    expected = [8, 4, 0, 0]
    assert_equal expected, @shift_generator.offset_gen.create_offset(four_digits)
  end

  def test_it_can_get_final_shift_values
    expected =  [10, 31, 71, 15]
    assert_equal expected, @shift_generator.shift_key("02715", "260220")
  end
end
