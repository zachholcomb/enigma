require 'date'

class OffsetGen
  attr_reader :date

  def initialize(date = Date.today.strftime('%d%m%y'))
    @date = date
  end

  def square_date(date_param)
    (date_param.to_i ** 2).to_s
  end

  def last_four_digits(squared_date_param)
    squared_date_param[-4..-1]
  end

  def create_offset(last_four_digits_param)#refactor to dynamic
    { key_A: last_four_digits_param[0].to_i,
      key_B: last_four_digits_param[1].to_i,
      key_C: last_four_digits_param[2].to_i,
      key_D: last_four_digits_param[3].to_i
    }
  end
end
