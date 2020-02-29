require 'date'

class ShiftGenerator
  attr_reader :key, :date

  def initialize
    @key = generate_random_key
    @date = Date.today.strftime('%d%m%y')
  end

  def generate_random_key
    rand_num = ""
    until rand_num.length == 5
      rand_num += rand(10).to_s
    end
    rand_num
  end

  def separate_random_key(five_digit_key)
    { key_A: five_digit_key[0..1].to_i,
      key_B: five_digit_key[1..2].to_i,
      key_C: five_digit_key[2..3].to_i,
      key_D: five_digit_key[3..4].to_i
    }
  end

  def final_shift_values(five_digit_key, last_four_digits_param)
    random_key_hash = separate_random_key(five_digit_key)
    date_offset_hash = separate_last_4_digits(last_four_digits_param)
    random_key_hash.merge(date_offset_hash) do |key, random_value, date_value|
      random_value + date_value
    end
  end
end
