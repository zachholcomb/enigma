class ShiftGenerator
  def generate_random_key
    rand_num = ""
    until rand_num.length == 5
      rand_num += rand(10).to_s
    end
    rand_num
  end
end
