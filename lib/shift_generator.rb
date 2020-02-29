require_relative 'key_gen'
require_relative 'offset_gen'

class ShiftGenerator
  attr_reader :key, :offset

  def initialize
    @key = KeyGen.new
    @offset = OffsetGen.new
  end

  def shift_key(five_digit_key, last_four_digits_param)
    random_key_hash = @key.create_key(five_digit_key)
    date_offset_hash = @offset.create_offset(last_four_digits_param)
    random_key_hash.merge(date_offset_hash) do |key, random_value, date_value|
      random_value + date_value
    end
  end
end
