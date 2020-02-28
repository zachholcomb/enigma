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

  def separate_random_key(five_digit_key)#refactor to dynamic
    { key_A: five_digit_key[0..1],
      key_B: five_digit_key[1..2],
      key_C: five_digit_key[2..3],
      key_D: five_digit_key[3..4]
    }
  end

  def square_date(date_param)
    (date_param.to_i ** 2).to_s
  end

  def last_4_digits(squared_date_param)
    squared_date_param[-4..-1]
  end

  def separate_last_4_digits(last_four_digits_param)#refactor to dynamic
    { key_a: last_four_digits_param[0],
      key_b: last_four_digits_param[1],
      key_c: last_four_digits_param[2],
      key_d: last_four_digits_param[3]
    }
  end
end
