require_relative 'key_gen'
require_relative 'offset_gen'

class ShiftGenerator
  attr_reader :key_gen, :offset_gen, :shift

  def initialize
    @key_gen = KeyGen.new
    @offset_gen = OffsetGen.new
  end

  def shift_key(five_digit_key, date)
    key_param = @key_gen.create_key(five_digit_key)
    date_param = @offset_gen.last_four_digits(@offset_gen.square_date(date))

    key_param.zip(@offset_gen.create_offset(date_param)).map do |pair|
      pair.sum
    end
  end
end
