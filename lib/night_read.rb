require './lib/file_reader'
require './lib/dictionary'

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
    # binding.pry
    # until array is empty then do these things
    separated_values = []
    until array.empty? do
      separated_values << array[0].zip(array[1], array[2])
      array.shift(3)
    end
    alpha_values = separated_values.flatten(1)
    joined_letters = alpha_values.map do |value|
      alphabet.key(value)
    end
    joined_letters.join
    # once these things are done, redefine array.shift 3x
  end

end


# file_read = FileReader.new
# other_way = NightReader.new(file_read.read).splitter
