class Cracker
end



  # def crack_message_shift(message)
  #   index_list = @character_set.map.with_index do  |character, index|
  #     index
  #   end
  #   compare_set = Hash[@character_set.zip(index_list)]
  #   last_4 = message[-4..-1].chars
  #   compare = [" ", "e", "n", "d"]
  #   compare_pairs = last_4.zip(compare)
  #   compare_pairs.map do |pair|
  #     if compare_set.fetch(pair[0]) - compare_set.fetch(pair[1]) < 0
  #       (compare_set.fetch(pair[0]) - compare_set.fetch(pair[1])) * -1
  #     else
  #       compare_set.fetch(pair[0]) - compare_set.fetch(pair[1])
  #     end
  #   end
