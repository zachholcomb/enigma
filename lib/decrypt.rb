require_relative 'enigma'

enigma = Enigma.new
message_reader = File.open(ARGV[0], "r")
message_to_decrypt = message_reader.read
decrypted_file = File.open(ARGV[1], "w")
output = enigma.decrypt(message_to_decrypt, ARGV[2], ARGV[3])
decrypted_file.write(output[:decryption])

puts "Created #{ARGV[1]} with the key #{output[:key]} and date #{output[:date]}"
