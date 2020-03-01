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
      require "pry"; binding.pry
      encrypt_letter(letter, @shift_generator.shift_key.values[index])
    end
  end

  def encrypt(message, key = @default_key, date = @default_date)
    # @shift_generator.shift_key(key, date)
    #
    # chop_message(message).each do |chunk|
    #   chunk.map.with_index do |letter, index|
    #     require "pry"; binding.pry
    #   end
    # end
  end
end
