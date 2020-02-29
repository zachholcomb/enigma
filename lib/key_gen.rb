require_relative './modules/create_defaults'

class KeyGen
  include Generable

  attr_reader :num

  def initialize(num = generate_random_key)
    @num = num
  end

  def create_key(five_digit_key)
    { key_A: five_digit_key[0..1].to_i,
      key_B: five_digit_key[1..2].to_i,
      key_C: five_digit_key[2..3].to_i,
      key_D: five_digit_key[3..4].to_i
    }
  end
end
