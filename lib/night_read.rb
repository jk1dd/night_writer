require './lib/file_reader'
require './lib/dictionary'
require './lib/file_writer'

class NightReader
attr_reader :alphabet, :message

  def initialize(message='')
    @message = message
    @dictionary = Dictionary.new
    @alphabet = @dictionary.dictionary
  end

  def splitter
    @message.split("\n")
  end

  def convert_braille_to_text
    array = []
    splitter.each do |line|
      array << line.scan(/../)
    end
    separated_values = []
    until array.empty?
      separated_values << array[0].zip(array[1], array[2])
      array.shift(3)
    end
    alpha_values = separated_values.flatten(1)
    joined_letters = alpha_values.map do |value|
      alphabet.key(value)
    end
    joined_letters.join
  end

  def sanitize
    convert_braille_to_text.gsub!(/\^./) { |letter| letter.delete('^').upcase }
  end

  def starter
    file_write = FileWriter.new
    splitter
    convert_braille_to_text
    file_write.write_braille(sanitize)
  end


end

# file_read = FileReader.new
# new_night_reader = NightReader.new(file_read.braille_read)
# new_night_reader.starter
