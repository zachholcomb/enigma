require_relative './modules/create_defaults'

class KeyGen
  include Generable

  def create_key(five_digit_key)
    [ five_digit_key[0..1].to_i,
      five_digit_key[1..2].to_i,
      five_digit_key[2..3].to_i,
      five_digit_key[3..4].to_i
    ]
  end
end
