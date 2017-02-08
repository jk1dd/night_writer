class FileWriter
  def write_braille (string)
    write_file = File.open(ARGV[1], 'w+')
    write_file.write(string)
    write_file.close
    puts "Created file #{ARGV[1]} containing #{string.length} characters."
  end
end
