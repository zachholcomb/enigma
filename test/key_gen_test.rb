require_relative 'test_helper'
require './lib/key_gen'

class KeyGenTest < Minitest::Test
  def setup
    @key_gen = KeyGen.new
  end

  def test_it_exists
    assert_instance_of KeyGen, @key_gen
  end

  def test_it_has_attributes
    @key_gen.stubs(:generate_random_key).returns("02715")
    assert_instance_of String, @key_gen.num
    assert_equal 5, @key_gen.num.length
  end

  def test_it_can_generate_random_five_digit_number_key
    assert_instance_of String, @key_gen.generate_random_key
    assert_equal 5, @key_gen.generate_random_key.to_s.length
  end

  def test_it_can_split_return_value_of_generate_random_key_into_separate_keys
    expected = { :key_A => 02, :key_B => 27, :key_C => 71, :key_D => 15}
    assert_equal expected, @key_gen.create_key("02715")

    random_test_key = @key_gen.generate_random_key
    assert_instance_of Hash, @key_gen.create_key(random_test_key)
    assert_equal 4, @key_gen.create_key(random_test_key).values.length
  end
end
