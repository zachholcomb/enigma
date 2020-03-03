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
  end

  def test_it_can_verify_key
    assert_equal true, @key_gen.verify_key("02715")
    assert_equal false, @key_gen.verify_key("999999")
    assert_equal false, @key_gen.verify_key("4444")
  end
end
