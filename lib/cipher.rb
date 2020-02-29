require_relative 'shift_generator'
require_relative './modules/create_defaults'

class Cipher
  include Generable

  attr_reader :shift_generator,
              :character_set,
              :default_key,
              :date

  def initialize
    @default_key = generate_random_key
    @date = create_date
    @shift_generator = ShiftGenerator.new
    @character_set = create_character_set
  end

  def encrypt(message, key = @default_key, date = @date)
    @shift_generator
  end
end
