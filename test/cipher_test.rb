require_relative 'test_helper'
require './lib/cipher'

class CipherTest < Minitest::Test
  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_has_attributes
    assert_instance_of ShiftGenerator, @cipher.shift_key
  end
end
