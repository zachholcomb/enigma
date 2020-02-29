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
    assert_instance_of KeyGen, @shift_generator.key
    assert_instance_of OffsetGen, @shift_generator.offset
  end

  def test_it_can_generate_random_five_digit_number_key
    assert_instance_of String, @shift_generator.key.generate_random_key
    assert_equal 5, @shift_generator.key.generate_random_key.to_s.length
  end

  def test_it_can_split_return_value_of_generate_random_key_into_separate_keys
    expected = { :key_A => 02, :key_B => 27, :key_C => 71, :key_D => 15}
    assert_equal expected, @shift_generator.key.create_key("02715")

    random_test_key = @shift_generator.key.generate_random_key
    assert_instance_of Hash, @shift_generator.key.create_key(random_test_key)
    assert_equal 4, @shift_generator.key.create_key(random_test_key).values.length
  end

  def test_it_can_get_final_shift_values
    expected = {key_A: 10, key_B: 31, key_C: 71, key_D: 15}
    assert_equal expected, @shift_generator.shift_key("02715", "8400")
  end
end
