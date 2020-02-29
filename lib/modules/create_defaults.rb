module Generable
  def generate_random_key
    rand_num = ""
    until rand_num.length == 5
      rand_num += rand(10).to_s
    end
    rand_num
  end

  def create_character_set
    ("a".."z").to_a << " "
  end

  def create_date
    Date.today.strftime('%d%m%y')
  end
end
