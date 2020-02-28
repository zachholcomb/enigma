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
    @shift_generator.stubs(:generate_random_key).returns("02715")
    assert_instance_of String, @shift_generator.key
    assert_equal 5, @shift_generator.key.length
    assert_equal "260220", @shift_generator.date
  end

  def test_it_can_generate_random_five_digit_number_key
    assert_instance_of String, @shift_generator.generate_random_key
    assert_equal 5, @shift_generator.generate_random_key.to_s.length
  end

  def test_it_can_split_return_value_of_generate_random_key_into_separate_keys
    expected = { :keyA => "02", :keyB => "27", :keyC => "71", :keyD => "15"}
    assert_equal expected, @shift_generator.separate_random_key("02715")

    random_test_key = @shift_generator.generate_random_key
    assert_instance_of Hash, @shift_generator.separate_random_key(random_test_key)
    assert_equal 4, @shift_generator.separate_random_key(random_test_key).values.length
  end

  def test_it_can_get_offset_keys_by_todays_date

  end
end
