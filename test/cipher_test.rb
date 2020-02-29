require_relative 'test_helper'
require './lib/cipher'

class CipherTest < Minitest::Test
  def setup
    Date.stubs(:today).returns(Date.new(1995, 8, 4))
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_can_generate_random_five_digit_number_key
    assert_instance_of String, @cipher.default_key
    assert_equal 5, @cipher.generate_random_key.to_s.length
  end

  def test_it_has_attributes
    assert_instance_of ShiftGenerator, @cipher.shift_generator

    expected = ["a", "b", "c", "d", "e", "f",
      "g", "h", "i", "j", "k", "l", "m", "n",
      "o", "p", "q", "r", "s", "t", "u", "v",
      "w", "x", "y", "z", " "]
    assert_equal expected, @cipher.character_set

    @cipher.stubs(:default_key).returns("02715")
    assert_instance_of String, @cipher.default_key
    assert_equal 5, @cipher.default_key.length
    assert_equal "02715", @cipher.default_key
    assert_equal "040895", @cipher.default_date
  end

  def test_it_can_encrypt_a_message_with_default_values
    assert_equal "keder ohulw", @cipher.encrypt("hello world", "02715", "040895")
  end
end
