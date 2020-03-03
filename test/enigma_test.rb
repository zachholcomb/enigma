require_relative 'test_helper'
require './lib/enigma'
require './lib/shift_generator'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    expected = ["a", "b", "c", "d", "e", "f",
      "g", "h", "i", "j", "k", "l", "m", "n",
      "o", "p", "q", "r", "s", "t", "u", "v",
      "w", "x", "y", "z", " "]

    assert_equal expected, @enigma.character_set
    assert_instance_of ShiftGenerator, @enigma.shift_generator
    assert_instance_of String, @enigma.default_key
    assert_equal 5, @enigma.default_key.length
    assert_instance_of String, @enigma.default_date
    assert_equal 6, @enigma.default_date.length
  end

  def test_it_can_encrypt_a_message_with_default_values
    @enigma.stubs(:default_date).returns("040895")
    @enigma.stubs(:default_key).returns("02715")

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world")
  end

  def test_it_can_encrypt_a_message_with_given_date_and_given_key
    expected = {
      encryption: "rib ydmcapu",
      key: "02715",
      date: "270220"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "270220")
  end

  def test_it_can_encrypt_a_message_with_given_key
    @enigma.stubs(:default_date).returns("270220")

    expected = {
      encryption: "rib ydmcapu",
      key: "02715",
      date: "270220"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_encrypt_a_message_with_given_date
    @enigma.stubs(:default_key).returns("02715")

    expected = {
      encryption: "rib ydmcapu",
      key: "02715",
      date: "270220"
    }

    assert_equal expected, @enigma.encrypt("hello world", "270220")
  end

  def test_it_can_decrypt_a_message_with_default_values
    @enigma.stubs(:default_key).returns("02715")
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw")
  end

  def test_it_can_decrypt_a_message_with_given_date_and_given_key
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "270220"
    }

    assert_equal expected, @enigma.decrypt("rib ydmcapu", "02715", "270220")
  end

  def test_it_can_decrypt_a_message_with_given_key
    @enigma.stubs(:default_date).returns("270220")

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "270220"
    }

    assert_equal expected, @enigma.decrypt("rib ydmcapu", "02715")
  end

  def test_it_can_decrypt_a_message_with_given_date
    @enigma.stubs(:default_key).returns("02715")

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "270220"
    }

    assert_equal expected, @enigma.decrypt("rib ydmcapu", "270220")
  end

  def test_it_can_encrypt_a_message_with_special_characters
    @enigma.stubs(:default_date).returns("040895")
    @enigma.stubs(:default_key).returns("02715")
    expected = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world!")
  end

  def test_it_can_decrypt_a_message_with_default_values
    @enigma.stubs(:default_date).returns("040895")
    @enigma.stubs(:default_key).returns("02715")
    expected = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw!")
  end

  def test_it_can_crack_message_with_given_date
    expected = {
      decryption: "hello world end",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.crack("keder ohulwthnw", "040895")
  end

  def test_it_can_crack_message_without_given_date
    expected = {
      decryption: "hello world end",
      key: "02715",
      date: "040895"
    }
    
    @enigma.stubs(:default_date).returns("040895")
    assert_equal expected, @enigma.crack("keder ohulwthnw")
  end
end
