require_relative 'key_gen'
require_relative 'offset_gen'

class ShiftGenerator
  attr_reader :key, :offset, :shift

  def initialize
    @key = KeyGen.new
    @offset = OffsetGen.new
  end

  def shift_key(five_digit_key, date)
    key_param = @key.create_key(five_digit_key)
    date_param = @offset.last_four_digits(@offset.square_date(date))

    @shift = key_param.zip(@offset.create_offset(date_param)).map do |pair|
      pair.sum
    end
  end
end
