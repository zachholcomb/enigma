require_relative 'test_helper'
require './lib/cracker'

class CrackerTest < Minitest::Test
  def setup
    @cracker = Cracker.new
  end

  def test_it_exists
    assert_instance_of Cracker, @cracker
  end
end
