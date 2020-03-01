require_relative 'cipher'

class Enigma < Cipher

  def initialize
    super
  end

  def encrypt(message, key = self.default_key, date = self.default_date)
    shift = input_verification(key, date)
    { encryption: encrypt_message(message, shift[0]),
      key: shift[1],
      date: shift[2]
    }
  end

  def decrypt(message, key = self.default_key, date = self.default_date)
    # require "pry"; binding.pry
    shift = input_verification(key, date)

    { decryption: decrypt_message(message, shift[0]),
      key: shift[1],
      date: shift[2]
    }
  end
end
