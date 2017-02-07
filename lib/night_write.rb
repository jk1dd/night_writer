require './lib/file_reader'
require './lib/dictionary'
require 'pry'

class NightWriter
attr_accessor :alphabet, :message

  def initialize(message="")
    @dictionary = Dictionary.new
    @alphabet = @dictionary.dictionary
    @message = message
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

  def triplicate
    final_message = message
    2.times do
      final_message += message
    end
    final_message
  end

  def top_line
    top_string = ""
    message.split('').each do |char|
      if letter?(char)
        if char == char.upcase
          top_string += alphabet["capital"][0] + alphabet[char.downcase][0]
        else
          top_string += alphabet[char][0]
        end
      else
        top_string += alphabet[char][0]
      end
    end
    top_string
  end

  def mid_line
    mid_string = ""
    message.split('').each do |char|
      if letter?(char)
        if char == char.upcase
          mid_string += alphabet["capital"][1] + alphabet[char.downcase][1]
        else
          mid_string += alphabet[char][1]
        end
      else
        mid_string += alphabet[char][1]
      end
    end
    mid_string
  end

  def bottom_line
    bottom_string = ""
    message.split('').each do |char|
      if letter?(char)
        if char == char.upcase
          bottom_string += alphabet["capital"][2] + alphabet[char.downcase][2]
        else
          bottom_string += alphabet[char][2]
        end
      else
        bottom_string += alphabet[char][2]
      end
    end
    bottom_string
  end

  def combine_lines
    combined_lines = "#{top_line}\n#{mid_line}\n#{bottom_line}"
  end

  def count_capitals
    message.chars.count do |char|
      capital?(char)
    end
  end

  def count_non_capitals
    message.chars.count do |char|
      !capital?(char)
    end
  end

  def count_total_spaces
    (count_capitals * 2) + count_non_capitals
  end

end
#new = NightWriter.new("hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello")
