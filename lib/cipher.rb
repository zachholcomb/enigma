require_relative 'shift_generator'
require_relative './modules/create_defaults'

class Cipher
  include Generable

  attr_reader :shift_generator,
              :character_set,
              :default_key,
              :default_date

  def initialize
    @default_key = generate_random_key
    @default_date = create_date
    @shift_generator = ShiftGenerator.new
    @character_set = create_character_set
  end

  def chop_message(message)
    message.downcase.split("").each_slice(4).to_a
  end

  def encrypt_letter(letter, shift)
    encrypted_set = Hash[@character_set.zip(@character_set.rotate(shift))]
    encrypted_set.fetch(letter)
  end

  def encrypt_chop(chop, shift_key)
    chop.map.with_index do |letter, index|
      encrypt_letter(letter, shift_key[index])
    end
  end

  def encrypt(*args)
    if args.length == 1
      shift = @shift_generator.shift_key(self.default_key, self.default_date)
    elsif args.length == 2 && args[1].length == 5
      shift = @shift_generator.shift_key(args[1], self.default_date)
    elsif args.length == 2 && args[1].length == 6
      shift = @shift_generator.shift_key(self.default_key, args[1])
    elsif args.length == 3
      shift = @shift_generator.shift_key(args[1], args[2])
    end

    chop_message(args[0]).map do |chunk|
      encrypt_chop(chunk, shift)
    end.join
  end
end
