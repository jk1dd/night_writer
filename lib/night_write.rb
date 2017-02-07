require './lib/file_reader'
require 'pry'

class NightWriter
attr_accessor :alphabet, :message

  def initialize(message="")
    @alphabet = {"a" => ["0.","..",".."], "b" => ["0.","0.",".."], "c" => ["00","..",".."], "d" => ["00",".0",".."],
   "e" => ["0.",".0",".."], "f" => ["00","0.",".."], "g" => ["00","00",".."], "h" => ["0.","00",".."],
   "i" => [".0","0.",".."], "j" => [".0","00",".."], "k" => ["0.","..","0."], "l" => ["0.","0.","0."],
   "m" => ["00","..","0."], "n" => ["00",".0","0."], "o" => ["0.",".0","0."], "p" => ["00","0.","0."],
   "q" => ["00","00","0."], "r" => ["0.","00","0."], "s" => [".0","0.","0."], "t" => [".0","00","0."],
   "u" => ["0.","..","00"], "v" => ["0.","0.","00"], "w" => [".0","00",".0"], "x" => ["00","..","00"],
   "y" => ["00",".0","00"], "z" => ["0.",".0","00"], "!" => ["..","00","0."], "'" => ["..","..","0."],
   "," => ["..","0.",".."], "-" => ["..","..","00"], "." => ["..","00",".0"], "?" => ["..","0.","00"],
   "capital" => ["..", "..", ".0"], "number" => [".0", ".0", "00"], " " => ["..","..",".."]}
   @message = message
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
      top_string += alphabet[char][0]
        # binding.pry
    end
    top_string
  end

  def mid_line
    mid_string = ""
    message.split('').each do |char|
      mid_string += alphabet[char][1]
    end
    mid_string
  end

  def bottom_line
    bottom_string = ""
    message.split('').each do |char|
      bottom_string += alphabet[char][2]
    end
    bottom_string
  end

end

new = NightWriter.new("hello")
puts new.top_line + "\n" + new.mid_line + "\n" + new.bottom_line
