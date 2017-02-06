class FileReaderWriter

  plain_file = File.open(ARGV[0], "r")
  incoming_text = plain_file.read
  plain_file.close
  braille_text = incoming_text.upcase # to be replaced by braille translation methods
  writer = File.open(ARGV[1], "w")
  writer.write(braille_text)
  writer.close

puts "Created #{ARGV[1]} containing #{braille_text.length} characters."

end
