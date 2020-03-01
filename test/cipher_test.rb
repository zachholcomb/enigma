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

  def test_it_can_chop_message
    expected = [['h', 'e', 'l', 'l'], ['o', ' ', 'w', 'o'], ['r', 'l', 'd']]
    assert_equal expected, @cipher.chop_message("hello world")
  end

  def test_it_can_encrypt_letter
    assert_equal 'k', @cipher.encrypt_letter('h', 3)
    assert_equal 'e', @cipher.encrypt_letter('e', 27)
    assert_equal 'd', @cipher.encrypt_letter('l', 73)
    assert_equal 'e', @cipher.encrypt_letter('l', 20)
  end

  def test_it_can_encrypt_chunk
    expected = [3, 27, 73, 20]

    assert_equal ['k', 'e', 'd', 'e'],
    @cipher.encrypt_chop(['h', 'e', 'l', 'l'], expected)
  end

  def test_it_can_encrypt_message
    expected = [3, 27, 73, 20]
    assert_equal "keder ohulw", @cipher.encrypt_message("hello world", expected)
  end

  def test_it_can_decrypt_letter
    assert_equal 'h', @cipher.decrypt_letter('k', 3)
    assert_equal 'e', @cipher.decrypt_letter('e', 27)
    assert_equal 'l', @cipher.decrypt_letter('d', 73)
    assert_equal 'l', @cipher.decrypt_letter('e', 20)
  end

  def test_it_can_decrypt_chunk
    expected = [3, 27, 73, 20]

    assert_equal ['h', 'e', 'l', 'l'],
    @cipher.decrypt_chop(['k', 'e', 'd', 'e'], expected)
  end

  def test_it_can_decrypt_message
    expected = [3, 27, 73, 20]
    assert_equal "hello world", @cipher.decrypt_message("keder ohulw", expected)
  end
end
