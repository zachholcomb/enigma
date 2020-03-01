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

  def decrypt_letter(letter, shift)
    encrypted_set = Hash[@character_set.zip(@character_set.rotate(-shift))]
    encrypted_set.fetch(letter)
  end

  def decrypt_chop(chop, shift_key)
    chop.map.with_index do |letter, index|
      decrypt_letter(letter, (shift_key[index]))
    end
  end

  def encrypt_chop(chop, shift_key)
    chop.map.with_index do |letter, index|
      encrypt_letter(letter, shift_key[index])
    end
  end

  def encrypt(message, key = self.default_key, date = self.default_date)
    if key.length != 5
      date = key
      key = self.default_key
    end

    shift = @shift_generator.shift_key(key, date)

    encrypted_message = chop_message(message).map do |chunk|
      encrypt_chop(chunk, shift)
    end.join

    { encryption: encrypted_message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key = self.default_key, date = self.default_date)
    if key.length != 5
      date = key
      key = self.default_key
    end

    shift = @shift_generator.shift_key(key, date)

    decrypted_message = chop_message(message).map do |chunk|
      decrypt_chop(chunk, shift)
    end.join

    { decryption: decrypted_message,
      key: key,
      date: date
    }
  end
end
