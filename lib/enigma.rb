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
    shift = input_verification(key, date)
    { decryption: decrypt_message(message, shift[0]),
      key: shift[1],
      date: shift[2]
    }
  end

  def crack(message, date = self.default_date)
    cracked_message_key = crack_message(message, date)
    { decryption: decrypt_message(message, cracked_message_key[0]),
      key: cracked_message_key[1],
      date: cracked_message_key[2]
    }
  end
end
