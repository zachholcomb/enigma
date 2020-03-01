require_relative 'test_helper'
require './lib/offset_gen'

class OffsetGenTest < Minitest::Test
  def setup
    @offset_gen = OffsetGen.new
  end

  def test_it_exists
    assert_instance_of OffsetGen, @offset_gen
  end

  def test_it_can_square_date_parameter
    test_date = "270220"
    assert_equal "73018848400", @offset_gen.square_date(test_date)
  end

  def test_it_can_get_last_4_digits_from_sqaure_date
    squared_date_param = "73018848400"
    assert_equal "8400", @offset_gen.last_four_digits(squared_date_param)
  end

  def test_it_can_separate_last_4_digits_from_square_dates_into_keys
    four_digits = "8400"
    expected = [8, 4, 0, 0]
    assert_equal expected, @offset_gen.create_offset(four_digits)
  end
end
