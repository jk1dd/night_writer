require './lib/file_reader'
require './lib/file_writer'
require './lib/dictionary'
require 'pry'

class NightWriter
attr_accessor :alphabet, :message

  def initialize(message='')
    @dictionary = Dictionary.new
    @alphabet = @dictionary.dictionary
    @message = message
    @all_lines = []
    @split_lines = []
  end

  def letter?(lookAhead)
  lookAhead =~ /[[:alpha:]]/
  end

  def capital? (letter)
    if letter?(letter)
      if letter == letter.upcase
        return true
      end
    end
  end

  def top_line
    top_string = ""
    message.split('').each do |char|
      if letter?(char)
        if char == char.upcase
          top_string += alphabet["^"][0] + alphabet[char.downcase][0]
        else
          top_string += alphabet[char][0]
        end
      else
        top_string += alphabet[char][0]
      end
    end
    @all_lines << top_string
    top_string
  end

  def mid_line
    mid_string = ""
    message.split('').each do |char|
      if letter?(char)
        if char == char.upcase
          mid_string += alphabet["^"][1] + alphabet[char.downcase][1]
        else
          mid_string += alphabet[char][1]
        end
      else
        mid_string += alphabet[char][1]
      end
    end
    @all_lines << mid_string
    mid_string
  end

  def bottom_line
    bottom_string = ""
    message.split('').each do |char|
      if letter?(char)
        if char == char.upcase
          bottom_string += alphabet["^"][2] + alphabet[char.downcase][2]
        else
          bottom_string += alphabet[char][2]
        end
      else
        bottom_string += alphabet[char][2]
      end
    end
    @all_lines << bottom_string
    bottom_string
  end

  def combine_lines
    combined_lines = "#{top_line}\n#{mid_line}\n#{bottom_line}"
  end

  def splitter
    @all_lines.each do |line|
      @split_lines << line.chars.each_slice(80).to_a.map { |slice| slice.join }
    end
    @split_lines
  end

  def joiner
    joined_text = ''
    (@split_lines.length - 1).times do |i|
      @split_lines.each do |line|
        joined_text += line[i] + "\n"
      end
    end
    joined_text
  end

  def starter
    if message.length >= 40
      file_write = FileWriter.new
      combine_lines
      splitter
      file_write.write_braille(joiner)
    else
      file_write = FileWriter.new
      file_write.write_braille(combine_lines)
    end
  end
end

if __FILE__ == $0
file_read = FileReader.new
new_night = NightWriter.new(file_read.read)
new_night.starter
end
