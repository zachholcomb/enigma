require_relative 'test_helper'
require './lib/key_gen'

class KeyGenTest < Minitest::Test
  def setup
    @key_gen = KeyGen.new
  end

  def test_it_exists
    assert_instance_of KeyGen, @key_gen
  end

  def test_it_can_split_return_value_of_generate_random_key_into_separate_keys
    expected = [02, 27, 71, 15]
    assert_equal expected, @key_gen.create_key("02715")

    random_test_key = @key_gen.generate_random_key
    assert_instance_of Array, @key_gen.create_key(random_test_key)
    assert_equal 4, @key_gen.create_key(random_test_key).length
  end
end
