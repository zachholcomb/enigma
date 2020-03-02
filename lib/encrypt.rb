require_relative 'enigma'

enigma = Enigma.new
message_reader = File.open(ARGV[0], "r")
message_to_encrypt = message_reader.read
encrypted_file = File.open(ARGV[1], "w")
output = enigma.encrypt(message_to_encrypt)
encrypted_file.write(output[:encryption])

puts "Created #{ARGV[1]} with the key #{output[:key]} and date #{output[:date]}"
