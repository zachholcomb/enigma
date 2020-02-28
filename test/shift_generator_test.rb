require_relative 'test_helper'
require './lib/shift_generator'

class ShiftGeneratorTest < Minitest::Test
  def setup
    @shift_generator = ShiftGenerator.new
  end

  def test_it_exists
    assert_instance_of ShiftGenerator, @shift_generator
  end

  def test_it_can_generate_random_five_digit_number_key
    assert_instance_of String, @shift_generator.generate_random_key
    assert_equal 5, @shift_generator.generate_random_key.to_s.length
  end
end
