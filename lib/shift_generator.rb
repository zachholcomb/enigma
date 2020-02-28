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
    { keyA: five_digit_key[0..1],
      keyB: five_digit_key[1..2],
      keyC: five_digit_key[2..3],
      keyD: five_digit_key[3..4]
    }
  end

  def square_date(date_param)
    (date_param.to_i ** 2).to_s
  end

  def last_4_digits(squared_date_param)
    squared_date_param[-4..-1]
  end
end
