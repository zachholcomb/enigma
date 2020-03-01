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
    return letter if !encrypted_set.keys.include?(letter)
    encrypted_set.fetch(letter)
  end

  def encrypt_chop(chop, shift_key)
    chop.map.with_index do |letter, index|
      encrypt_letter(letter, shift_key[index])
    end
  end

  def encrypt_message(message, shift)
    chop_message(message).map do |chunk|
      encrypt_chop(chunk, shift)
    end.join
  end

  def decrypt_letter(letter, shift)
    decrypted_set = Hash[@character_set.zip(@character_set.rotate(-shift))]
    return letter if !decrypted_set.keys.include?(letter)
    decrypted_set.fetch(letter)
  end

  def decrypt_chop(chop, shift_key)
    chop.map.with_index do |letter, index|
      decrypt_letter(letter, (shift_key[index]))
    end
  end

  def decrypt_message(message, shift)
    chop_message(message).map do |chunk|
      decrypt_chop(chunk, shift)
    end.join
  end

  def input_verification(key = self.default_key, date = self.default_date)
    if !@shift_generator.key_gen.verify_key(key)
      date = key
      key = self.default_key
    end
    [@shift_generator.shift_key(key, date), key, date]
  end
end
